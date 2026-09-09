import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'import_graph.dart';

/// The application's own Dart sources, which have to satisfy the rules this
/// file reads them against.
final Directory _lib = Directory('lib');

/// A tree shaped the way the architecture says one should be.
final Directory _clean = Directory('test/architecture/fixtures/clean/lib');

/// A tree that breaks every rule at least once, so a passing suite means the
/// checker still finds them rather than that nothing is wrong.
final Directory _violations = Directory(
  'test/architecture/fixtures/violations/lib',
);

/// The rules, as `checkLayering` cites them.
const String _presentationRule =
    'FE-STR-04: presentation depends on domain, never on data';
const String _dataRule =
    'FE-STR-04: data depends on domain, never on presentation';
const String _domainRule =
    'FE-STR-04: domain imports neither data nor presentation';
const String _coreRule = 'FE-STR-04: core never imports features';
const String _barrelRule =
    'FE-STR-08: a feature reaches another feature through its barrel, never '
    'its internals';

void main() {
  group('the application as it stands', () {
    test('crosses no layer boundary', () {
      expect(checkLayering(buildImportGraph(_lib)), isEmpty);
    });

    test('is actually being read, not passing by being empty', () {
      final ImportGraph graph = buildImportGraph(_lib);

      expect(graph.length, greaterThan(90));
      expect(graph.paths, contains('features/capture/domain/domain.dart'));
      expect(graph.paths, contains('core/db/db.dart'));
    });
  });

  group('a tree shaped the way the rules say', () {
    late ImportGraph graph;

    setUpAll(() {
      graph = buildImportGraph(_clean);
    });

    test('crosses no layer boundary', () {
      expect(checkLayering(graph), isEmpty);
    });

    test('lets data and presentation both reach into domain', () {
      expect(
        graph.targetsOf('features/capture/data/capture_repository_impl.dart'),
        contains('features/capture/domain/capture_session.dart'),
      );
      expect(
        graph.targetsOf('features/capture/presentation/capture_screen.dart'),
        contains('features/capture/domain/capture_session.dart'),
      );
    });

    test('lets a feature reach another through its barrel', () {
      expect(
        graph.targetsOf('features/records/domain/record.dart'),
        contains('features/capture/capture.dart'),
      );
      expect(checkLayering(graph), isEmpty);
    });
  });

  group('a tree that breaks the rules', () {
    late List<Violation> violations;

    setUpAll(() {
      violations = checkLayering(buildImportGraph(_violations));
    });

    test('presentation reaching into data is reported', () {
      expect(
        violations,
        contains(
          isA<Violation>()
              .having(
                (Violation v) => v.file,
                'file',
                'features/records/presentation/records_screen.dart',
              )
              .having(
                (Violation v) => v.import,
                'import',
                '../data/records_repository_impl.dart',
              )
              .having((Violation v) => v.rule, 'rule', _presentationRule),
        ),
      );
    });

    test('data reaching into presentation is reported', () {
      expect(_rulesFor(violations, _dataRule), isNotEmpty);
      expect(
        _filesFor(violations, _dataRule),
        contains('features/capture/data/capture_repository_impl.dart'),
      );
    });

    test('domain reaching into either is reported', () {
      expect(
        _filesFor(violations, _domainRule),
        contains('features/capture/domain/capture_session.dart'),
      );
    });

    test('core reaching into a feature is reported', () {
      expect(_filesFor(violations, _coreRule), contains('core/db/db.dart'));
    });

    test('a feature reaching past another feature barrel is reported', () {
      expect(
        _filesFor(violations, _barrelRule),
        contains('features/records/presentation/records_screen.dart'),
      );
    });

    test('every rule is broken by something, so none goes untested', () {
      expect(violations.map((Violation v) => v.rule).toSet(), <String>{
        _presentationRule,
        _dataRule,
        _domainRule,
        _coreRule,
        _barrelRule,
      });
    });

    test('one import breaking two rules is reported twice', () {
      final List<Violation> both = violations
          .where(
            (Violation v) =>
                v.import == '../../capture/data/capture_repository_impl.dart',
          )
          .toList();

      expect(
        both.map((Violation v) => v.rule),
        unorderedEquals(<String>[_barrelRule, _presentationRule]),
      );
    });

    test('every violation names the file, the line and the import', () {
      for (final Violation violation in violations) {
        expect(violation.file, endsWith('.dart'));
        expect(violation.line, greaterThan(0));
        expect(violation.import, isNotEmpty);
        expect(violation.rule, startsWith('FE-STR-'));
      }
    });

    test('the line is the one the directive sits on', () {
      final Violation second = violations.firstWhere(
        (Violation v) => v.import == '../data/records_repository_impl.dart',
      );

      expect(second.line, 2);
    });
  });

  group('reading the directives', () {
    test('a package URI naming this package resolves like a path', () {
      final Directory root = _tree(<String, String>{
        'features/capture/presentation/capture_screen.dart':
            "import 'package:tapture/features/capture/data/repo.dart';\n",
        'features/capture/data/repo.dart': '',
      });

      expect(
        checkLayering(buildImportGraph(root)).map((Violation v) => v.rule),
        contains(_presentationRule),
      );
    });

    test('an export crossing a boundary counts like an import', () {
      final Directory root = _tree(<String, String>{
        'core/db/db.dart': "export '../../features/capture/capture.dart';\n",
        'features/capture/capture.dart': '',
      });

      expect(
        checkLayering(buildImportGraph(root)).map((Violation v) => v.rule),
        contains(_coreRule),
      );
    });

    test('a directive leaving the package is not the graph to judge', () {
      final Directory root = _tree(<String, String>{
        'features/capture/domain/model.dart':
            "import 'dart:io';\nimport 'package:flutter/material.dart';\n",
      });

      expect(
        buildImportGraph(root).targetsOf('features/capture/domain/model.dart'),
        isEmpty,
      );
      expect(checkLayering(buildImportGraph(root)), isEmpty);
    });

    test('a commented-out directive is not a directive', () {
      final Directory root = _tree(<String, String>{
        'features/capture/domain/model.dart':
            "// import '../data/repo.dart';\n",
        'features/capture/data/repo.dart': '',
      });

      expect(checkLayering(buildImportGraph(root)), isEmpty);
    });

    test('a directory that is not there is an empty graph', () {
      final Directory root = Directory.systemTemp.createTempSync(
        'tapture_layering_',
      );
      addTearDown(() => root.deleteSync(recursive: true));

      final ImportGraph graph = buildImportGraph(
        Directory('${root.path}/absent'),
      );

      expect(graph.length, 0);
      expect(checkLayering(graph), isEmpty);
    });

    test('a feature reaching into its own layers is nobody else business', () {
      final Directory root = _tree(<String, String>{
        'features/capture/presentation/screen.dart':
            "import '../domain/model.dart';\n",
        'features/capture/domain/model.dart': '',
      });

      expect(checkLayering(buildImportGraph(root)), isEmpty);
    });
  });
}

/// The files reported against [rule].
Iterable<String> _filesFor(List<Violation> violations, String rule) {
  return _rulesFor(violations, rule).map((Violation v) => v.file);
}

/// The violations reported against [rule].
Iterable<Violation> _rulesFor(List<Violation> violations, String rule) {
  return violations.where((Violation v) => v.rule == rule);
}

/// Writes a throwaway lib tree, so a case can be about one directive without a
/// fixture folder growing a file nobody reads twice.
Directory _tree(Map<String, String> files) {
  final Directory root = Directory.systemTemp.createTempSync(
    'tapture_layering_',
  );
  addTearDown(() => root.deleteSync(recursive: true));
  final Directory lib = Directory('${root.path}/lib')..createSync();
  files.forEach((String path, String source) {
    final File file = File('${lib.path}/$path');
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(source);
  });
  return lib;
}
