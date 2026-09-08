# 165 — Delete a field

**Phase** 09 · Templates  |  **Depends on** [161](161-field-list-editor.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Remove a field, retiring rather than destroying any values it already holds.

## Files

- `frontend/lib/features/templates/presentation/field_delete_action.dart` (new)

## Steps

1. Warn with the count of records holding a value; mark values retired instead of deleting them.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Deleting a field never loses captured data.
- [ ] Tests written and passing: Test that retired values survive and export as retired.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
