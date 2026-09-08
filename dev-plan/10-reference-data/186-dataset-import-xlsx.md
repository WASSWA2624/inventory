# 186 — Import a dataset from a spreadsheet

**Phase** 10 · Reference data and lookups  |  **Depends on** [185](185-dataset-import-csv.md), [175](../09-templates/175-xlsx-read-workbook.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Reuse the workbook reader to import a sheet as a dataset.

## Files

- `lib/features/reference/data/dataset_xlsx_import.dart` (new)

## Reuse

- Uses the workbook reader and header detection from the template phase.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
