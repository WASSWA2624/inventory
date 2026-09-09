# 182 — Import predefined rows

**Phase** 09 · Templates  |  **Depends on** [181](181-xlsx-template-create.md), [095](../04-data-layer/095-template-rows-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Read existing spreadsheet rows into the checklist the operator works through.

## Files

- `frontend/lib/features/templates/data/predefined_rows_import.dart` (new)

## Steps

1. Map the identifier and label columns; keep the original row number for write-back.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Rows import with their spreadsheet positions preserved.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
