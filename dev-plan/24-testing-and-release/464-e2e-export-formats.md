# 464 — End-to-end: every export format

**Phase** 24 · Testing and release  |  **Depends on** [456](456-e2e-capture-to-export.md), [379](../18-export/379-zip-package.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Produce XLSX, CSV, JSON, PDF and ZIP offline and validate each output.

## Files

- `integration_test/export_formats_test.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every format opens correctly in a reader and matches the record count.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
