import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/check_analyzer_config.dart';

void main() {
  group('analyzer configuration', () {
    test('the checked-in configuration satisfies every requirement', () {
      expect(findAnalyzerConfigViolations(Directory.current), isEmpty);
    });

    test('a strict type check turned off is reported', () {
      final Directory root = _fixture(
        options: _realOptions().replaceAll(
          'strict-casts: true',
          'strict-casts: false',
        ),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('strict-casts is false, expected true')),
      );
    });

    test('a strict type check deleted altogether is reported', () {
      final Directory root = _fixture(
        options: _realOptionsWithout('strict-inference: true'),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('does not set strict-inference')),
      );
    });

    test('a const rule that stops being enabled is reported', () {
      final Directory root = _fixture(
        options: _realOptionsWithout('- prefer_const_constructors'),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('does not enable prefer_const_constructors')),
      );
    });

    test('a warning that stops being an error is reported', () {
      final Directory root = _fixture(
        options: _realOptionsWithout('unused_element: error'),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('unused_element is a warning, not an error')),
      );
    });

    test('a rule enabled without being promoted is reported', () {
      final Directory root = _fixture(
        options: _realOptions().replaceAll(
          '    - directives_ordering',
          '    - directives_ordering\n    - always_declare_return_types',
        ),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(
          contains(
            'always_declare_return_types, enabled in analysis_options.yaml, '
            'reports as a suggestion',
          ),
        ),
      );
    });

    test('a rule demoted to a suggestion is reported', () {
      final Directory root = _fixture(
        options: _realOptions().replaceAll(
          'avoid_print: error',
          'avoid_print: info',
        ),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('avoid_print is info')),
      );
    });

    test('a rule silenced altogether is reported', () {
      final Directory root = _fixture(
        options: _realOptions().replaceAll(
          'unused_import: error',
          'unused_import: ignore',
        ),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('unused_import is ignore')),
      );
    });

    test('a configuration that only inherits the shared set is reported '
        'for every rule it leaves as a suggestion', () {
      final Directory root = _fixture(
        options: 'include: package:flutter_lints/flutter.yaml\n',
      );

      final Iterable<String> reported = findAnalyzerConfigViolations(
        root,
      ).map(_asLine);

      expect(reported, hasLength(greaterThan(1)));
      expect(reported, contains(contains('does not set strict-casts')));
      expect(reported, contains(contains('does not set strict-raw-types')));
      expect(
        reported,
        contains(contains('does not enable directives_ordering')),
      );
      expect(reported, contains(contains('strict_raw_type is a warning')));
      expect(
        reported,
        contains(
          contains(
            'avoid_print, enabled in package:flutter_lints/flutter.yaml, '
            'reports as a suggestion',
          ),
        ),
      );
    });

    test('every violation names the file and the line that must change', () {
      final Directory root = _fixture(
        options: '# nothing is configured here\n',
      );

      for (final ({String file, int line, String message}) violation
          in findAnalyzerConfigViolations(root)) {
        expect(violation.file, isNotEmpty);
        expect(violation.line, greaterThanOrEqualTo(0));
        expect(violation.message, isNotEmpty);
      }
    });

    test('core losing the documentation rule is reported', () {
      final Directory root = _fixture(
        coreOptions: _realCoreOptionsWithout('- public_member_api_docs'),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('does not enable public_member_api_docs')),
      );
    });

    test('core no longer inheriting the project configuration is reported', () {
      final Directory root = _fixture(
        coreOptions: _realCoreOptionsWithout(
          'include: ../../analysis_options.yaml',
        ),
      );

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(
          contains('does not include the project analysis_options.yaml'),
        ),
      );
    });

    test('core losing its configuration file is reported', () {
      final Directory root = _fixture();
      File('${root.path}/lib/core/analysis_options.yaml').deleteSync();

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        contains(contains('has no lib/core/analysis_options.yaml')),
      );
    });

    test('a tree with no analyzer configuration is reported for both', () {
      final Directory root = Directory.systemTemp.createTempSync(
        'tapture_analyzer_',
      );
      addTearDown(() => root.deleteSync(recursive: true));

      expect(
        findAnalyzerConfigViolations(root).map(_asLine),
        containsAll(<Matcher>[
          contains(
            'analysis_options.yaml:0: the project has no '
            'analysis_options.yaml',
          ),
          contains(
            'lib/core/analysis_options.yaml:0: the shared surface has '
            'no lib/core/analysis_options.yaml',
          ),
        ]),
      );
    });
  });
}

/// Builds a throwaway package holding the two options files and the package
/// graph the shared rule set is included through, each defaulting to the copy
/// this project actually ships.
Directory _fixture({String? options, String? coreOptions}) {
  final Directory root = Directory.systemTemp.createTempSync(
    'tapture_analyzer_',
  );
  addTearDown(() => root.deleteSync(recursive: true));
  File(
    '${root.path}/analysis_options.yaml',
  ).writeAsStringSync(options ?? _realOptions());
  Directory('${root.path}/lib/core').createSync(recursive: true);
  File(
    '${root.path}/lib/core/analysis_options.yaml',
  ).writeAsStringSync(coreOptions ?? _realCoreOptions());
  Directory('${root.path}/.dart_tool').createSync();
  File('${root.path}/.dart_tool/package_config.json').writeAsStringSync(
    File('.dart_tool/package_config.json').readAsStringSync(),
  );
  return root;
}

String _realOptions() => File('analysis_options.yaml').readAsStringSync();

String _realCoreOptions() =>
    File('lib/core/analysis_options.yaml').readAsStringSync();

/// The shipped configuration with one line deleted, so a test proves the
/// checker notices a real setting going missing rather than a made-up one.
String _realOptionsWithout(String line) => _without(_realOptions(), line);

String _realCoreOptionsWithout(String line) =>
    _without(_realCoreOptions(), line);

String _without(String contents, String line) {
  return contents
      .split('\n')
      .where((String each) => each.trim() != line)
      .join('\n');
}

String _asLine(({String file, int line, String message}) violation) =>
    '${violation.file}:${violation.line}: ${violation.message}';
