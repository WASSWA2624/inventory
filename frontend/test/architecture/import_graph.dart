import 'dart:io';

/// One import or export that crosses a boundary the architecture forbids.
///
/// Carries the file it is written in, the line it sits on, the directive's own
/// URI, and the rule it breaks, so a report says what to change and why
/// without anybody having to look the rule up.
typedef Violation = ({String file, int line, String import, String rule});

/// One directive, as written and as resolved.
///
/// [target] is the path the directive points at, relative to the lib root, or
/// null when it leaves the package — `package:flutter/material.dart` and
/// `dart:io` resolve to nothing this graph has an opinion about.
typedef _Directive = ({int line, String uri, String? target});

/// The rules this graph is read against, quoted from
/// `frontend/.rules/01-structure.md` so a violation cites one rather than a
/// preference.
const String _presentationRule =
    'FE-STR-04: presentation depends on domain, never on data';
const String _dataRule =
    'FE-STR-04: data depends on domain, never on '
    'presentation';
const String _domainRule =
    'FE-STR-04: domain imports neither data nor presentation';
const String _coreRule = 'FE-STR-04: core never imports features';
const String _barrelRule =
    'FE-STR-08: a feature reaches another feature through its barrel, never '
    'its internals';

/// The three layers inside a feature.
const String _data = 'data';
const String _domain = 'domain';
const String _presentation = 'presentation';

/// A directive, matched at the start of a line the way `dart format` leaves
/// one. A commented-out directive does not start a line, so it is not one.
final RegExp _directive = RegExp(
  '''^\\s*(?:import|export)\\s+['"]([^'"]+)['"]''',
);

/// Every Dart file under a lib directory, and what each one imports.
class ImportGraph {
  const ImportGraph._(this.root, this._files);

  /// The lib directory this was built from.
  final Directory root;

  /// One entry per Dart file: its path relative to [root], written with
  /// forward slashes, and every directive it declares.
  ///
  /// Kept to this library, which is where the rules that read it live, so the
  /// shape a directive is recorded in is not something anybody else depends
  /// on.
  final Map<String, List<_Directive>> _files;

  /// How many files the graph holds.
  int get length => _files.length;

  /// The paths of every file in the graph, in the order they were read.
  Iterable<String> get paths => _files.keys;

  /// What [path] points at, as paths relative to [root]. Directives leaving
  /// the package are not included: nothing here has an opinion about them.
  Iterable<String> targetsOf(String path) {
    return <String>[
      for (final _Directive directive in _files[path] ?? const <_Directive>[])
        if (directive.target case final String target) target,
    ];
  }
}

/// Reads every Dart file under [libDir] and records what each one imports.
///
/// Directives are read from the source text rather than from a parsed syntax
/// tree: this package depends on nothing that could parse Dart, and adding one
/// would need its own task under FE-FLOW-06.
ImportGraph buildImportGraph(Directory libDir) {
  final Map<String, List<_Directive>> files = <String, List<_Directive>>{};
  if (!libDir.existsSync()) {
    return ImportGraph._(libDir, files);
  }
  final String root = _asPosix(libDir.absolute.path);
  final List<File> sources = <File>[
    for (final FileSystemEntity entity in libDir.listSync(recursive: true))
      if (entity is File && entity.path.endsWith('.dart')) entity,
  ];
  sources.sort((File a, File b) => a.path.compareTo(b.path));
  final Map<String, File> byPath = <String, File>{
    for (final File source in sources)
      _relative(root, _asPosix(source.absolute.path)): source,
  };
  final Set<String> known = byPath.keys.toSet();
  byPath.forEach((String path, File source) {
    files[path] = _directivesOf(source, path, known);
  });
  return ImportGraph._(libDir, files);
}

/// Reports every directive in [g] that crosses a boundary the architecture
/// forbids, with the file, the line, the directive and the rule it breaks.
///
/// Reports all of them. One import can break two rules at once — reaching into
/// another feature's data layer from a screen is both — and a report that
/// stopped at the first would hide the second.
List<Violation> checkLayering(ImportGraph g) {
  final List<Violation> violations = <Violation>[];
  for (final String path in g.paths) {
    for (final _Directive directive in g._files[path]!) {
      final String? target = directive.target;
      if (target == null) {
        continue;
      }
      for (final String rule in _rulesBrokenBy(path, target)) {
        violations.add((
          file: path,
          line: directive.line,
          import: directive.uri,
          rule: rule,
        ));
      }
    }
  }
  return violations;
}

/// Every rule an import from [from] to [to] breaks.
Iterable<String> _rulesBrokenBy(String from, String to) sync* {
  if (_isCore(from) && _isFeature(to)) {
    yield _coreRule;
  }

  final String? fromFeature = _featureOf(from);
  final String? toFeature = _featureOf(to);
  if (fromFeature != null &&
      toFeature != null &&
      fromFeature != toFeature &&
      !_isBarrelOf(to, toFeature)) {
    yield _barrelRule;
  }

  final String? fromLayer = _layerOf(from);
  final String? toLayer = _layerOf(to);
  if (fromLayer == null || toLayer == null) {
    return;
  }
  if (fromLayer == _presentation && toLayer == _data) {
    yield _presentationRule;
  }
  if (fromLayer == _data && toLayer == _presentation) {
    yield _dataRule;
  }
  if (fromLayer == _domain && (toLayer == _data || toLayer == _presentation)) {
    yield _domainRule;
  }
}

/// The directives [source] declares, each resolved against the lib root.
List<_Directive> _directivesOf(File source, String path, Set<String> known) {
  final List<_Directive> directives = <_Directive>[];
  final List<String> lines = source.readAsLinesSync();
  for (int index = 0; index < lines.length; index++) {
    final Match? match = _directive.firstMatch(lines[index]);
    if (match == null) {
      continue;
    }
    final String uri = match.group(1)!;
    directives.add((
      line: index + 1,
      uri: uri,
      target: _resolve(path, uri, known),
    ));
  }
  return directives;
}

/// Where a directive points, relative to the lib root, or null when it leaves
/// the package.
///
/// A `package:` URI naming this package's own lib is the same thing as a path
/// under it, so both shapes land on one answer and the rules only have to know
/// about one. Which package is this one is decided by whether [known] holds
/// the file: `package:flutter/material.dart` names no file under this lib, so
/// it leaves the package like any other.
String? _resolve(String from, String uri, Set<String> known) {
  if (uri.startsWith('dart:')) {
    return null;
  }
  if (uri.startsWith('package:')) {
    final int slash = uri.indexOf('/');
    if (slash == -1) {
      return null;
    }
    final String candidate = uri.substring(slash + 1);
    return known.contains(candidate) ? candidate : null;
  }
  if (uri.contains(':')) {
    return null;
  }
  final List<String> segments = from.split('/')
    ..removeLast()
    ..addAll(uri.split('/'));
  final List<String> resolved = <String>[];
  for (final String segment in segments) {
    if (segment == '.' || segment.isEmpty) {
      continue;
    }
    if (segment == '..') {
      if (resolved.isEmpty) {
        return null;
      }
      resolved.removeLast();
      continue;
    }
    resolved.add(segment);
  }
  return resolved.join('/');
}

/// Whether [path] is shared code under `core/`.
bool _isCore(String path) => path.startsWith('core/');

/// Whether [path] belongs to a feature.
bool _isFeature(String path) => path.startsWith('features/');

/// The feature [path] belongs to, or null when it belongs to none.
String? _featureOf(String path) {
  final List<String> segments = path.split('/');
  if (segments.length < 2 || segments.first != 'features') {
    return null;
  }
  return segments[1];
}

/// Whether [path] is the barrel [feature] exports itself through.
bool _isBarrelOf(String path, String feature) {
  return path == 'features/$feature/$feature.dart';
}

/// The layer [path] sits in, or null when it sits in none.
String? _layerOf(String path) {
  final List<String> segments = path.split('/');
  if (segments.length < 4 || segments.first != 'features') {
    return null;
  }
  final String layer = segments[2];
  return <String>[_data, _domain, _presentation].contains(layer) ? layer : null;
}

/// [path] with the host's separators written the way this graph writes them.
String _asPosix(String path) => path.replaceAll(r'\', '/');

/// [path] with [root] taken off the front.
String _relative(String root, String path) {
  final String prefix = root.endsWith('/') ? root : '$root/';
  return path.startsWith(prefix) ? path.substring(prefix.length) : path;
}
