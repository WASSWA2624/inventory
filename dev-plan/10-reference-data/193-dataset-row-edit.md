# 193 — Edit a dataset row

**Phase** 10 · Reference data  |  **Depends on** [192](192-dataset-browser.md), [078](../03-design-system/078-app-form-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Correct reference data in place.

## Files

- `frontend/lib/features/reference/presentation/dataset_row_edit_screen.dart` (new)

## Steps

1. Record the edit in the audit log; do not retroactively change records already prefilled.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Fixing a supplier's phone number does not silently rewrite history.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
