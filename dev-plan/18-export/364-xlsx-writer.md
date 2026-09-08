# 364 — XLSX writer core

**Phase** 18 · Export  |  **Depends on** [005](../01-orchestration/005-dependency-allowlist.md), [361](361-value-formatter.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write records into a workbook, off the UI thread, with progress.

## Files

- `lib/core/export/xlsx_writer.dart` (new)

## Steps

1. Map field keys to output columns; append after the last used row; write types correctly.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A five-thousand-record export completes without freezing the interface.
- [ ] Tests written and passing: Test that output reopens in a spreadsheet reader with correct types.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
