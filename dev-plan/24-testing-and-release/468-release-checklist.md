# 468 — Release gate program

**Phase** 24 · Testing and release  |  **Depends on** [467](467-release-build.md), [435](../22-privacy-and-security/435-secret-scan-test.md), [462](462-e2e-merge.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the program that verifies every release condition and refuses to produce a build when one fails.

## Files

- `tool/release_gate.dart` (new)

## Contract

```dart
Future<int> main(List<String> args)  // --tag <version>; exits 0 only when every gate passes
```

## Steps

1. Run and record: the full verify command, a secret scan over the built artefacts, a migration test from the previously released schema, an offline end-to-end run, an export opened by a spreadsheet reader, and the permission list diffed against the previous release.
2. Print a gate table of pass, fail and waived, and write it beside the artefact as the release record.
3. Exit non-zero on any failure; a skipped gate counts as a failure unless waived explicitly on the command line.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A build cannot be produced while any gate fails.
- [ ] Tests written and passing: `test/tool/release_gate_test.dart` covers the pass, fail and waiver paths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
