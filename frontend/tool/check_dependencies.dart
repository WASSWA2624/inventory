import 'dart:io';

/// Where the two files this compares live, relative to the directory checked.
const String _pubspec = 'pubspec.yaml';
const String _allowlist = 'tool/allowlist.yaml';

/// The rule a package that nobody approved has broken.
const String _rule =
    'frontend/.rules/13-workflow.md FE-FLOW-06: adding a package requires its '
    'own task, an allowlist entry with a pinned version, a licence check and a '
    'note on what it replaces';

/// How hard the checker complains. An unapproved package or a version that
/// drifted fails the build; a package that left pubspec.yaml but is still
/// approved does not, because deleting a dependency breaks nothing — it only
/// leaves this file describing something that is no longer there.
enum _Severity { error, warning }

/// One thing wrong, and the file and line that has to change to fix it.
typedef _Violation = ({
  String file,
  int line,
  String message,
  _Severity severity,
});

/// A package as one of the two files declares it.
typedef _Entry = ({String version, int line});

/// Checks pubspec against the allowlist, printing one line per violation.
///
/// Takes the directory to check, defaulting to the working directory. Exits 0
/// when nothing is wrong or only a warning is, and 1 on any error.
Future<int> main(List<String> args) async {
  final Directory root = Directory(
    args.isEmpty ? Directory.current.path : args.first,
  );
  final List<_Violation> violations = _findViolations(root);
  for (final _Violation violation in violations) {
    stderr.writeln(
      '${violation.file}:${violation.line}: ${violation.severity.name}: '
      '${violation.message}',
    );
  }
  final int errors = violations
      .where((_Violation each) => each.severity == _Severity.error)
      .length;
  final int warnings = violations.length - errors;
  stdout.writeln(
    violations.isEmpty
        ? 'dependencies: every direct dependency is approved and pinned'
        : 'dependencies: $errors error(s), $warnings warning(s)',
  );
  exitCode = errors == 0 ? 0 : 1;
  return exitCode;
}

/// Reports every difference between what pubspec asks for and what the
/// allowlist approves: a package nobody approved, a version that drifted, and
/// an approval left behind by a package that has gone.
///
/// Reports all of them, so one run says everything that has to change.
List<_Violation> _findViolations(Directory root) {
  final File pubspec = File('${root.path}/$_pubspec');
  final File allowlist = File('${root.path}/$_allowlist');
  final List<_Violation> violations = <_Violation>[];
  if (!pubspec.existsSync()) {
    violations.add((
      file: _pubspec,
      line: 0,
      message:
          'the project has no $_pubspec, so nothing declares what it depends '
          'on',
      severity: _Severity.error,
    ));
  }
  if (!allowlist.existsSync()) {
    violations.add((
      file: _allowlist,
      line: 0,
      message:
          'the project has no $_allowlist, so every package is unapproved. '
          '$_rule',
      severity: _Severity.error,
    ));
  }
  if (violations.isNotEmpty) {
    return violations;
  }

  final Map<String, _Entry> declared = _readPubspec(pubspec);
  final Map<String, _Entry> approved = _readAllowlist(allowlist);

  for (final MapEntry<String, _Entry> package in declared.entries) {
    final _Entry? approval = approved[package.key];
    if (approval == null) {
      violations.add((
        file: _pubspec,
        line: package.value.line,
        message:
            '${package.key} is not on the allowlist. Add it to $_allowlist '
            'with a pinned version, a purpose and the task that introduced it, '
            'or take it back out. $_rule',
        severity: _Severity.error,
      ));
    } else if (approval.version != package.value.version) {
      violations.add((
        file: _pubspec,
        line: package.value.line,
        message:
            '${package.key} asks for ${package.value.version}; $_allowlist '
            'approves ${approval.version}. A version change is a change of '
            'dependency, so one of the two has to move',
        severity: _Severity.error,
      ));
    }
  }

  for (final MapEntry<String, _Entry> approval in approved.entries) {
    if (!declared.containsKey(approval.key)) {
      violations.add((
        file: _allowlist,
        line: approval.value.line,
        message:
            '${approval.key} is approved but $_pubspec no longer asks for it. '
            'Drop the entry so the allowlist keeps describing the project',
        severity: _Severity.warning,
      ));
    }
  }

  return violations;
}

/// Reads the direct dependencies pubspec declares, both runtime and dev, as
/// the version each asks for.
///
/// A transitive package is not read: nothing chooses one directly, so nothing
/// approves one directly either.
Map<String, _Entry> _readPubspec(File file) {
  const List<String> sections = <String>['dependencies', 'dev_dependencies'];
  final Map<String, _Entry> declared = <String, _Entry>{};
  final List<String> lines = file.readAsLinesSync();
  String? section;
  for (int index = 0; index < lines.length; index++) {
    final String raw = lines[index];
    final String trimmed = raw.trim();
    if (trimmed.isEmpty || trimmed.startsWith('#')) {
      continue;
    }
    final int indent = raw.length - raw.trimLeft().length;
    if (indent == 0) {
      section = trimmed.endsWith(':')
          ? trimmed.substring(0, trimmed.length - 1).trim()
          : null;
      continue;
    }
    if (indent != 2 || !sections.contains(section)) {
      continue;
    }
    final int separator = trimmed.indexOf(':');
    if (separator == -1) {
      continue;
    }
    final String name = trimmed.substring(0, separator).trim();
    final String inline = _unquote(trimmed.substring(separator + 1).trim());
    declared[name] = (
      version: inline.isNotEmpty ? inline : _nestedVersion(lines, index),
      line: index + 1,
    );
  }
  return declared;
}

/// The version of a package declared as a block rather than as one scalar:
/// `sdk: flutter` for a package that ships with Flutter, `version:` for a
/// hosted or git dependency that pins one.
///
/// Anything else is left as `unpinned`, which no allowlist entry matches, so
/// it is reported rather than quietly accepted.
String _nestedVersion(List<String> lines, int index) {
  for (int next = index + 1; next < lines.length; next++) {
    final String raw = lines[next];
    final String trimmed = raw.trim();
    if (trimmed.isEmpty || trimmed.startsWith('#')) {
      continue;
    }
    if (raw.length - raw.trimLeft().length <= 2) {
      break;
    }
    final int separator = trimmed.indexOf(':');
    if (separator == -1) {
      continue;
    }
    final String key = trimmed.substring(0, separator).trim();
    final String value = _unquote(trimmed.substring(separator + 1).trim());
    if (key == 'sdk') {
      return 'sdk';
    }
    if (key == 'version') {
      return value;
    }
  }
  return 'unpinned';
}

/// Reads the approved packages and the version each is approved at.
Map<String, _Entry> _readAllowlist(File file) {
  final Map<String, _Entry> approved = <String, _Entry>{};
  final List<String> lines = file.readAsLinesSync();
  bool inPackages = false;
  String? current;
  int currentLine = 0;
  for (int index = 0; index < lines.length; index++) {
    final String raw = lines[index];
    final String trimmed = raw.trim();
    if (trimmed.isEmpty || trimmed.startsWith('#')) {
      continue;
    }
    final int indent = raw.length - raw.trimLeft().length;
    if (indent == 0) {
      inPackages = trimmed == 'packages:';
      current = null;
      continue;
    }
    if (!inPackages) {
      continue;
    }
    final int separator = trimmed.indexOf(':');
    if (separator == -1) {
      continue;
    }
    final String key = trimmed.substring(0, separator).trim();
    final String value = _unquote(trimmed.substring(separator + 1).trim());
    if (indent == 2) {
      current = key;
      currentLine = index + 1;
      approved[key] = (version: 'unpinned', line: currentLine);
    } else if (indent == 4 && key == 'version' && current != null) {
      approved[current] = (version: value, line: currentLine);
    }
  }
  return approved;
}

/// Drops the quotes around a YAML scalar, so a quoted and a bare spelling of
/// the same value compare equal.
String _unquote(String value) {
  if (value.length < 2) {
    return value;
  }
  final String first = value.substring(0, 1);
  final String last = value.substring(value.length - 1);
  final bool quoted = first == last && (first == '"' || first == "'");
  return quoted ? value.substring(1, value.length - 1) : value;
}
