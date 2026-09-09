# 183 — Row alias editor

**Phase** 09 · Templates  |  **Depends on** [182](182-predefined-rows-import.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Teach the matcher local names for each row.

## Files

- `frontend/lib/features/templates/presentation/row_aliases_screen.dart` (new)

## Steps

1. Add aliases per row; import aliases in bulk from a column.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] "BP machine" reliably matches "Blood Pressure Machine".
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
