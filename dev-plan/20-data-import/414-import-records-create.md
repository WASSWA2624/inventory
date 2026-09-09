# 414 — Create records from rows

**Phase** 20 · Data import  |  **Depends on** [413](413-import-records-mapping.md), [300](../14-records/300-record-model.md), [088](../04-data-layer/088-transaction-helper.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Insert rows as records with source IMPORTED_TABLE, in one transaction with progress.

## Files

- `frontend/lib/features/import/domain/record_import.dart` (new)

## Steps

1. Apply validation per row; collect failures rather than aborting the whole import.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Ten thousand rows import without freezing the interface.
- [ ] Tests written and passing: Test over a fixture with some invalid rows.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
