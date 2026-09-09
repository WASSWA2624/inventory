# 180 — Confirm the column mapping

**Phase** 09 · Templates  |  **Depends on** [179](179-xlsx-type-inference.md), [065](../03-design-system/065-app-list-tile.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The two-column confirmation screen from the specification.

## Files

- `frontend/lib/features/templates/presentation/xlsx_mapping_screen.dart` (new)

## Steps

1. Show spreadsheet column to field with type and rule, each row editable, with skip.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Nothing is imported until the user confirms the mapping.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
