# 188 — Choose the key column

**Phase** 10 · Reference data and lookups  |  **Depends on** [185](185-dataset-import-csv.md), [059](../03-design-system/059-app-choice-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Pick the column that identifies a row, warning about duplicates.

## Files

- `lib/features/reference/presentation/dataset_key_screen.dart` (new)

## Steps

1. Show duplicate key counts before import completes.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A dataset with a non-unique key cannot be saved silently.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
