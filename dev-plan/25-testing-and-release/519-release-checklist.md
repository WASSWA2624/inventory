# 519 — Release gate program

**Phase** 25 · Testing and release  |  **Depends on** [518](518-release-build.md), [437](../22-privacy-and-security/437-secret-scan-test.md), [513](513-e2e-merge.md), [516](516-ci-pipeline.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the program that verifies every release condition and refuses to produce a build when one fails. A release
is now two artefacts, not one: the app and the backend it requires (§70), and the gate covers both.

## Files

- `frontend/tool/release_gate.dart` (new)

## Contract

```dart
Future<int> main(List<String> args)  // --tag <version>; exits 0 only when every gate passes
```

## Steps

1. Run and record, for the app: the full verify command, a secret scan over the built artefacts, a migration test
   from the previously released schema, an offline end-to-end run, an export opened by a spreadsheet reader, and
   the permission list diffed against the previous release.
2. Run and record, for the backend: `npm run verify`, its own migration test from the last released schema, the
   contract tests against the published specification, and a scan proving no provider key can leave the server.
3. Run and record, for the pair: the sign-in, proxy and offline end-to-end run (521), which is the gate that
   proves a required backend is never a required connection (§70.4).
4. Print a gate table of pass, fail and waived, and write it beside the artefact as the release record.
5. Exit non-zero on any failure; a skipped gate counts as a failure unless waived explicitly on the command line.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/12-testing.md`, `frontend/rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A build cannot be produced while any gate fails, in either the app or the backend.
- [ ] A backend whose contract tests fail blocks the app release, and the record says why.
- [ ] Tests written and passing: `frontend/test/tool/release_gate_test.dart` covers the pass, fail and waiver paths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
