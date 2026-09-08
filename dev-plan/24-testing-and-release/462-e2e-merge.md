# 462 — End-to-end: bundle merge

**Phase** 24 · Testing and release  |  **Depends on** [456](456-e2e-capture-to-export.md), [405](../19-bundles-and-merge/405-merge-apply.md), [407](../19-bundles-and-merge/407-merge-undo.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Export from one database, import into another, resolve a conflict, undo, redo.

## Files

- `integration_test/merge_test.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The test proves idempotency and a complete undo.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
