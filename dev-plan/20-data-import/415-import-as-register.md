# 415 — Import as a verification register

**Phase** 20 · Importing existing data  |  **Depends on** [412](412-import-records-create.md), [328](../15-data-quality/328-verification-prefill.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Choose whether imported rows become records or the register to verify against.

## Files

- `lib/features/import/presentation/import_purpose_step.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The verification flow works immediately after this import.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
