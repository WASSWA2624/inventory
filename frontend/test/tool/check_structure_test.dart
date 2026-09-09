import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/check_structure.dart';
import '../../tool/paths.dart';

void main() {
  group('directory layout', () {
    test('the checked-in tree satisfies every requirement', () {
      expect(findStructureViolations(Directory.current), isEmpty);
    });

    test('a required core directory that is deleted is reported', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/core/db').deleteSync(recursive: true);

      expect(
        findStructureViolations(root).map(_asLine),
        contains(contains('lib/core/db:0: the architecture requires this')),
      );
    });

    test('a required feature layer that is deleted is reported', () {
      final Directory root = _fixture();
      Directory(
        '${root.path}/$libRoot/features/capture/domain',
      ).deleteSync(recursive: true);

      expect(
        findStructureViolations(root).map(_asLine),
        contains(contains('lib/features/capture/domain:0:')),
      );
    });

    test('an unexpected top-level directory is reported', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/services').createSync();

      expect(
        findStructureViolations(root).map(_asLine),
        contains(
          contains('lib/services:0: nothing in tool/paths.dart names this'),
        ),
      );
    });

    test('an unexpected directory under core is reported', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/core/utils').createSync();

      expect(
        findStructureViolations(root).map(_asLine),
        contains(contains('lib/core/utils:0: nothing in tool/paths.dart')),
      );
    });

    test('an unexpected feature is reported', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/features/invoicing').createSync();

      expect(
        findStructureViolations(root).map(_asLine),
        contains(contains('lib/features/invoicing:0:')),
      );
    });

    test('a fourth layer inside a feature is reported', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/features/capture/util').createSync();

      expect(
        findStructureViolations(root).map(_asLine),
        contains(
          contains(
            'lib/features/capture/util:0: a feature is data/, domain/ and '
            'presentation/ and nothing else (FE-STR-03)',
          ),
        ),
      );
    });

    test('a directory left standing without its barrel is reported', () {
      final Directory root = _fixture();
      File('${root.path}/$libRoot/core/widgets/widgets.dart').deleteSync();

      expect(
        findStructureViolations(root).map(_asLine),
        contains(
          contains(
            'lib/core/widgets/widgets.dart:0: lib/core/widgets has no barrel',
          ),
        ),
      );
    });

    test('a folder starting with a dot is not an unexpected directory', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/.tapture_fixture').createSync();
      Directory('${root.path}/$libRoot/core/.tapture_fixture').createSync();

      expect(findStructureViolations(root), isEmpty);
    });

    test('every violation is reported, not only the first', () {
      final Directory root = _fixture();
      Directory('${root.path}/$libRoot/core/db').deleteSync(recursive: true);
      Directory('${root.path}/$libRoot/core/ids').deleteSync(recursive: true);
      Directory('${root.path}/$libRoot/services').createSync();

      final Iterable<String> reported = findStructureViolations(
        root,
      ).map(_asLine);

      expect(reported, contains(contains('lib/core/db:0:')));
      expect(reported, contains(contains('lib/core/ids:0:')));
      expect(reported, contains(contains('lib/services:0:')));
    });

    test('an empty tree is reported for every directory it lacks', () {
      final Directory root = Directory.systemTemp.createTempSync(
        'tapture_structure_',
      );
      addTearDown(() => root.deleteSync(recursive: true));

      expect(
        findStructureViolations(root),
        hasLength(greaterThanOrEqualTo(requiredDirectories.length)),
      );
    });

    test('every violation names the file and the line that must change', () {
      final Directory root = Directory.systemTemp.createTempSync(
        'tapture_structure_',
      );
      addTearDown(() => root.deleteSync(recursive: true));

      for (final ({String file, int line, String message}) violation
          in findStructureViolations(root)) {
        expect(violation.file, startsWith(libRoot));
        expect(violation.line, greaterThanOrEqualTo(0));
        expect(violation.message, isNotEmpty);
      }
    });
  });

  group('the canonical directory list', () {
    test('names every core directory once', () {
      expect(coreDirectories.toSet(), hasLength(coreDirectories.length));
      expect(coreDirectories, orderedEquals(coreDirectories.toList()..sort()));
    });

    test('names every feature once', () {
      expect(featureDirectories.toSet(), hasLength(featureDirectories.length));
      expect(
        featureDirectories,
        orderedEquals(featureDirectories.toList()..sort()),
      );
    });

    test('gives every directory but the two containers a barrel', () {
      for (final String directory in requiredDirectories) {
        final String? barrel = barrelFor(directory);
        if (directory == 'core' || directory == 'features') {
          expect(barrel, isNull);
          continue;
        }
        expect(barrel, '$directory/${directory.split('/').last}.dart');
      }
    });
  });
}

/// Builds a throwaway tree holding exactly the layout `tool/paths.dart`
/// describes, so a test can break one thing and see only that reported.
Directory _fixture() {
  final Directory root = Directory.systemTemp.createTempSync(
    'tapture_structure_',
  );
  addTearDown(() => root.deleteSync(recursive: true));
  for (final String directory in requiredDirectories) {
    Directory('${root.path}/$libRoot/$directory').createSync(recursive: true);
    final String? barrel = barrelFor(directory);
    if (barrel != null) {
      File('${root.path}/$libRoot/$barrel').writeAsStringSync('library;\n');
    }
  }
  return root;
}

String _asLine(({String file, int line, String message}) violation) =>
    '${violation.file}:${violation.line}: ${violation.message}';
