# 413 — Duplicate check during import

**Phase** 20 · Importing existing data  |  **Depends on** [412](412-import-records-create.md), [318](../15-data-quality/318-duplicate-detection.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Compare each incoming row against existing records before inserting.

## Files

- `lib/features/import/domain/import_duplicates.dart` (new)

## Steps

1. Offer Keep existing, Replace, Merge, and an apply-to-all option.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No import silently overwrites an existing record.
- [ ] Tests written and passing: Test of each choice.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
