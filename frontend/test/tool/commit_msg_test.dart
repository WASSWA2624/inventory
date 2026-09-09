@Timeout(Duration(minutes: 5))
library;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The hook under test, run the way git runs one: as a shell script handed the
/// file holding the message.
const String _hook = 'tool/hooks/commit-msg';

/// Subjects the hook has to let through: a three-digit task number, a space,
/// and what the commit did.
const List<String> _accepted = <String>[
  '009 Install the git hooks',
  '001 Create the Flutter project',
  '522 Release the thing',
  '003 x',
];

/// Subjects the hook has to turn away, and what is wrong with each.
const Map<String, String> _rejected = <String, String>{
  'Install the git hooks': 'no task number at all',
  '9 Install the git hooks': 'one digit rather than three',
  '09 Install the git hooks': 'two digits rather than three',
  '0091 Install the git hooks': 'four digits, so no space where one is due',
  '009Install the git hooks': 'no space after the number',
  '  009 Install the git hooks': 'the number does not start the subject',
  'Fix 009 in the installer': 'the number is in the subject, not at its front',
  '009': 'a number and nothing about what was done',
  '': 'nothing at all',
};

void main() {
  group('the commit-msg hook', () {
    late String shell;

    setUpAll(() {
      final String? found = _shell();
      expect(
        found,
        isNotNull,
        reason:
            'no shell to run a git hook with. Git ships one, and git is what '
            'runs these hooks, so a host that can commit has one.',
      );
      shell = found!;
    });

    for (final String subject in _accepted) {
      test('accepts "$subject"', () async {
        final _Run run = await _check(shell, subject);

        expect(run.exitCode, 0);
        expect(run.complaint, isEmpty);
      });
    }

    _rejected.forEach((String subject, String because) {
      test('rejects "$subject" — $because', () async {
        final _Run run = await _check(shell, subject);

        expect(run.exitCode, 1);
      });
    });

    test('a rejection says what the rule is', () async {
      final _Run run = await _check(shell, 'Install the git hooks');

      expect(
        run.complaint,
        contains('the subject must start with a three-digit task number'),
      );
    });

    test('a rejection quotes the subject it turned away', () async {
      final _Run run = await _check(shell, 'Install the git hooks');

      expect(run.complaint, contains('subject: Install the git hooks'));
    });

    test('a rejection shows one that would have worked', () async {
      final _Run run = await _check(shell, 'Install the git hooks');

      expect(run.complaint, contains('example: 009 Install the git hooks'));
    });

    test('only the subject decides, not the body', () async {
      final _Run accepted = await _check(
        shell,
        '009 Install the git hooks',
        body: 'This body mentions nothing useful.',
      );
      final _Run rejected = await _check(
        shell,
        'Install the git hooks',
        body: '009 is in the body, where the hook does not look.',
      );

      expect(accepted.exitCode, 0);
      expect(rejected.exitCode, 1);
    });
  });
}

/// What one run of the hook reported.
typedef _Run = ({int exitCode, String complaint});

/// Writes [subject] to a message file and runs the hook over it, the way git
/// does when somebody commits.
Future<_Run> _check(String shell, String subject, {String body = ''}) async {
  final Directory root = Directory.systemTemp.createTempSync('tapture_msg_');
  addTearDown(() => root.deleteSync(recursive: true));
  final File message = File('${root.path}/COMMIT_EDITMSG');
  message.writeAsStringSync(
    body.isEmpty ? '$subject\n' : '$subject\n\n$body\n',
  );

  final ProcessResult result = await Process.run(
    shell,
    <String>[_hook, message.path],
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  );
  final Object? errors = result.stderr;
  return (
    exitCode: result.exitCode,
    complaint: (errors is String ? errors : '').trim(),
  );
}

/// A shell that can run a git hook.
///
/// On a POSIX host that is `sh`. On Windows nothing of the sort is on the
/// path, but git ships the shell it runs hooks with, so this asks git where it
/// lives rather than guessing at an install location.
String? _shell() {
  if (!Platform.isWindows) {
    return 'sh';
  }
  final ProcessResult located = Process.runSync('git', <String>['--exec-path']);
  final Object? output = located.stdout;
  if (located.exitCode != 0 || output is! String) {
    return null;
  }
  Directory? directory = Directory(output.trim());
  while (directory != null && directory.existsSync()) {
    for (final String candidate in <String>[
      '${directory.path}/usr/bin/sh.exe',
      '${directory.path}/bin/sh.exe',
    ]) {
      if (File(candidate).existsSync()) {
        return candidate;
      }
    }
    final Directory parent = directory.parent;
    directory = parent.path == directory.path ? null : parent;
  }
  return null;
}
