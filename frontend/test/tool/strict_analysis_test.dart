@Timeout(Duration(minutes: 5))
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// One line of `dart analyze --format=machine`: what the analyzer found, how
/// hard it complained, and where.
typedef _Diagnostic = ({String severity, String code, String file, int line});

/// A fixture file, and the diagnostic the configuration must raise on it.
typedef _Violation = ({String source, String code});

/// Where the fixtures are written, all three inside the project so they are
/// analysed with the shipped configuration rather than with a copy of it.
///
/// The analyzer walks past a folder whose name starts with a dot unless it is
/// named on the command line, so the project's own run stays clean while these
/// files do not. Two of them sit under `lib/` because the documentation rule
/// only speaks about a package's public surface.
const String _violationRoot = '.dart_tool/tapture_strict_analysis';
const String _coreRoot = 'lib/core/.tapture_strict_analysis';
const String _featureRoot = 'lib/.tapture_strict_analysis';

/// Code the configuration has to accept, including a public member carrying no
/// documentation: only `lib/core/` owes that line.
const String _cleanSource = '''
class CaptureCount {
  const CaptureCount(this.total);

  final int total;

  bool get isEmpty => total == 0;
}

int sum(List<int> values) {
  int total = 0;
  for (final int value in values) {
    total += value;
  }
  return total;
}
''';

/// One violation each, of the strict checks and of the rules this project
/// turns on, keyed by the fixture file that holds it.
const Map<String, _Violation> _violations = <String, _Violation>{
  'implicit_cast.dart': (
    code: 'INVALID_ASSIGNMENT',
    source: '''
int lengthOf(dynamic value) {
  final String text = value;
  return text.length;
}
''',
  ),
  'uninitialized_variable.dart': (
    code: 'INFERENCE_FAILURE_ON_UNINITIALIZED_VARIABLE',
    source: '''
String describe() {
  var pending;
  pending = 5;
  return 'pending: \$pending';
}
''',
  ),
  'raw_type.dart': (
    code: 'STRICT_RAW_TYPE',
    source: '''
List firstBatch() => <int>[1];
''',
  ),
  'const_declaration.dart': (
    code: 'PREFER_CONST_DECLARATIONS',
    source: '''
String greeting() {
  final String hello = 'hello';
  return hello;
}
''',
  ),
  'unsorted_directives.dart': (
    code: 'DIRECTIVES_ORDERING',
    source: '''
import 'dart:io';
import 'dart:convert';

int encodedLength(String text) => utf8.encode(text).length + pid;
''',
  ),
  'awaited_return.dart': (
    code: 'UNNECESSARY_AWAIT_IN_RETURN',
    source: '''
Future<int> total() async {
  return await Future<int>.value(0);
}
''',
  ),
  'unused_element.dart': (
    code: 'UNUSED_ELEMENT',
    source: '''
int _unreachable() => 0;
''',
  ),
};

/// One violation each of the diagnostics the analyzer reports as a warning and
/// this project reads as an error. No lint rule enables these, so nothing but
/// the `errors:` section keeps them above a suggestion — and nothing but a
/// fixture proves the section still names them.
const Map<String, _Violation> _promotions = <String, _Violation>{
  'do_not_store_assignment.dart': (
    code: 'ASSIGNMENT_OF_DO_NOT_STORE',
    source: '''
import 'package:meta/meta.dart';

@doNotStore
int seed() => 1;

final int stored = seed();
''',
  ),
  'do_not_store_return.dart': (
    code: 'RETURN_OF_DO_NOT_STORE',
    source: '''
import 'package:meta/meta.dart';

@doNotStore
int seed() => 1;

int reuse() => seed();
''',
  ),
  'catch_error_body.dart': (
    code: 'BODY_MIGHT_COMPLETE_NORMALLY_CATCH_ERROR',
    source: '''
Future<int> recover(Future<int> pending) {
  return pending.catchError((Object error) {});
}
''',
  ),
  'duplicate_import.dart': (
    code: 'DUPLICATE_IMPORT',
    source: '''
import 'dart:convert';
import 'dart:convert';

int encodedLength(String text) => jsonEncode(text).length;
''',
  ),
  'duplicate_shown_name.dart': (
    code: 'DUPLICATE_SHOWN_NAME',
    source: '''
import 'dart:convert' show jsonEncode, jsonEncode;

int encodedLength(String text) => jsonEncode(text).length;
''',
  ),
  'duplicate_hidden_name.dart': (
    code: 'DUPLICATE_HIDDEN_NAME',
    source: '''
import 'dart:convert' hide utf8, utf8;

int encodedLength(String text) => jsonEncode(text).length;
''',
  ),
  'equal_keys_in_map.dart': (
    code: 'EQUAL_KEYS_IN_MAP',
    source: '''
Map<String, int> counts() => <String, int>{'first': 1, 'first': 2};
''',
  ),
  'equal_elements_in_set.dart': (
    code: 'EQUAL_ELEMENTS_IN_SET',
    source: '''
Set<int> totals() => <int>{1, 1};
''',
  ),
  'invalid_factory.dart': (
    code: 'INVALID_FACTORY_METHOD_IMPL',
    source: '''
import 'package:flutter/foundation.dart';

class Registry {
  @factory
  int make() => 0;
}
''',
  ),
  'language_version_override.dart': (
    code: 'INVALID_LANGUAGE_VERSION_OVERRIDE',
    source: '''
// @dart=3.99
int answer() => 42;
''',
  ),
  'must_be_overridden.dart': (
    code: 'MISSING_OVERRIDE_OF_MUST_BE_OVERRIDDEN',
    source: '''
import 'package:meta/meta.dart';

class Contract {
  @mustBeOverridden
  void run() {}
}

class Breaks extends Contract {}
''',
  ),
  'literal_constructor.dart': (
    code: 'NON_CONST_CALL_TO_LITERAL_CONSTRUCTOR',
    source: '''
import 'package:meta/meta.dart';

@immutable
class Marker {
  @literal
  const Marker();
}

final Marker marker = Marker();
''',
  ),
  'nullable_catch_clause.dart': (
    code: 'NULLABLE_TYPE_IN_CATCH_CLAUSE',
    source: '''
int guarded() {
  try {
    return 0;
  } on Object? catch (_) {
    return 1;
  }
}
''',
  ),
  'detached_override.dart': (
    code: 'OVERRIDE_ON_NON_OVERRIDING_MEMBER',
    source: '''
class Detached {
  @override
  void run() {}
}
''',
  ),
  'pattern_never_matches.dart': (
    code: 'PATTERN_NEVER_MATCHES_VALUE_TYPE',
    source: '''
bool isText(int value) {
  if (value case String _) {
    return true;
  }
  return false;
}
''',
  ),
  'text_direction.dart': (
    code: 'TEXT_DIRECTION_CODE_POINT_IN_LITERAL',
    source: '''
const String reversed = 'start\u202Eend';
''',
  ),
  'nan_comparison.dart': (
    code: 'UNNECESSARY_NAN_COMPARISON',
    source: '''
bool isNan(double value) => value == double.nan;
''',
  ),
  'null_comparison.dart': (
    code: 'UNNECESSARY_NULL_COMPARISON',
    source: '''
bool isNull(int value) => value == null;
''',
  ),
  'wildcard_pattern.dart': (
    code: 'UNNECESSARY_WILDCARD_PATTERN',
    source: '''
int classify(Object? value) {
  switch (value) {
    case int _ && _:
      return 0;
    default:
      return 1;
  }
}
''',
  ),
};

/// A public member with nothing saying what it is for. It is written twice:
/// under `core/`, where the documentation rule applies, and outside it, where
/// it does not.
const String _undocumentedSource = '''
class CaptureService {
  int captures = 0;
}
''';

const String _coreFixture = 'undocumented_shared_member.dart';
const String _featureFixture = 'undocumented_feature_member.dart';

void main() {
  group('the analyzer on this configuration', () {
    late _Analysis fixture;
    late _Analysis project;

    setUpAll(() async {
      _writeFixture();
      fixture = await _analyze(<String>[
        _violationRoot,
        _coreRoot,
        _featureRoot,
      ]);
      project = await _analyze(<String>[Directory.current.path]);
    });

    tearDownAll(_deleteFixture);

    test('the project it runs on reports zero issues', () {
      expect(project.diagnostics, isEmpty);
      expect(project.exitCode, 0);
    });

    test('code that satisfies the configuration passes', () {
      expect(fixture.diagnosticsIn('clean.dart'), isEmpty);
    });

    for (final MapEntry<String, _Violation> violation in _violations.entries) {
      test('${violation.key} fails with ${violation.value.code}', () {
        expect(fixture.codesIn(violation.key), contains(violation.value.code));
      });
    }

    for (final MapEntry<String, _Violation> promotion in _promotions.entries) {
      test('${promotion.key} fails with ${promotion.value.code}', () {
        expect(fixture.codesIn(promotion.key), contains(promotion.value.code));
      });
    }

    test('an undocumented public member of core fails the analyzer', () {
      expect(fixture.codesIn(_coreFixture), contains('PUBLIC_MEMBER_API_DOCS'));
    });

    test('the same member outside core is accepted', () {
      expect(fixture.diagnosticsIn(_featureFixture), isEmpty);
    });

    test('a violation fails the run, not only the report', () {
      expect(fixture.exitCode, isNot(0));
    });

    test('nothing the analyzer finds sits below an error', () {
      expect(
        fixture.diagnostics.map((_Diagnostic each) => each.severity),
        everyElement('ERROR'),
      );
    });

    test('every diagnostic names the file and the line that must change', () {
      for (final _Diagnostic diagnostic in fixture.diagnostics) {
        expect(diagnostic.file, isNotEmpty);
        expect(diagnostic.line, greaterThan(0));
      }
    });
  });
}

/// What one `dart analyze` run reported.
class _Analysis {
  const _Analysis(this.exitCode, this.diagnostics);

  /// The exit code of the run: non-zero when the analyzer found anything.
  final int exitCode;

  /// Every diagnostic the run reported, in the order it reported them.
  final List<_Diagnostic> diagnostics;

  /// The diagnostics reported against the fixture file named [file].
  Iterable<_Diagnostic> diagnosticsIn(String file) {
    return diagnostics.where(
      (_Diagnostic diagnostic) => diagnostic.file.endsWith('/$file'),
    );
  }

  /// The diagnostic codes reported against the fixture file named [file].
  Iterable<String> codesIn(String file) {
    return diagnosticsIn(file).map((_Diagnostic each) => each.code);
  }
}

/// Writes the three fixture folders, replacing whatever an interrupted run
/// left behind.
void _writeFixture() {
  _deleteFixture();
  Directory(_violationRoot).createSync(recursive: true);
  File(
    '$_violationRoot/analysis_options.yaml',
  ).writeAsStringSync('include: ../../analysis_options.yaml\n');
  File('$_violationRoot/clean.dart').writeAsStringSync(_cleanSource);
  for (final MapEntry<String, _Violation> violation in <String, _Violation>{
    ..._violations,
    ..._promotions,
  }.entries) {
    File(
      '$_violationRoot/${violation.key}',
    ).writeAsStringSync(violation.value.source);
  }

  Directory(_coreRoot).createSync(recursive: true);
  File('$_coreRoot/$_coreFixture').writeAsStringSync(_undocumentedSource);
  Directory(_featureRoot).createSync(recursive: true);
  File('$_featureRoot/$_featureFixture').writeAsStringSync(_undocumentedSource);
}

void _deleteFixture() {
  for (final String path in <String>[_violationRoot, _coreRoot, _featureRoot]) {
    final Directory fixture = Directory(path);
    if (fixture.existsSync()) {
      fixture.deleteSync(recursive: true);
    }
  }
}

/// Runs the analyzer over [paths] and reads back what it found.
Future<_Analysis> _analyze(List<String> paths) async {
  final ProcessResult result = await Process.run(_dartExecutable(), <String>[
    'analyze',
    '--format=machine',
    ...paths,
  ]);
  final Object? output = result.stdout;
  final List<_Diagnostic> diagnostics = <_Diagnostic>[];
  for (final String line in (output is String ? output : '').split('\n')) {
    final List<String> fields = line.trim().split('|');
    if (fields.length < 5) {
      continue;
    }
    diagnostics.add((
      severity: fields[0],
      code: fields[2],
      file: fields[3].replaceAll(r'\\', '/'),
      line: int.tryParse(fields[4]) ?? 0,
    ));
  }
  return _Analysis(result.exitCode, diagnostics);
}

/// The Dart command line, which is not the executable running this test:
/// `flutter test` runs it inside the Flutter tester.
String _dartExecutable() {
  final String suffix = Platform.isWindows ? '.exe' : '';
  final String running = Platform.resolvedExecutable;
  if (running.split(RegExp(r'[/\\]')).last == 'dart$suffix') {
    return running;
  }
  final String? flutterRoot = Platform.environment['FLUTTER_ROOT'];
  return flutterRoot == null
      ? 'dart$suffix'
      : '$flutterRoot/bin/cache/dart-sdk/bin/dart$suffix';
}
