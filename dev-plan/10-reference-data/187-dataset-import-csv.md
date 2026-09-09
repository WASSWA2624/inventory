# 187 — Import a dataset from CSV

**Phase** 10 · Reference data  |  **Depends on** [186](186-dataset-model.md), [126](../05-file-storage/126-file-validation.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Read a CSV into a dataset with a chosen key column.

## Files

- `frontend/lib/features/reference/data/dataset_csv_import.dart` (new)

## Steps

1. Handle delimiter detection, quoted values, byte-order marks and blank rows.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A ten-thousand-row file imports without freezing the interface.
- [ ] Tests written and passing: Test over awkward CSV fixtures.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
