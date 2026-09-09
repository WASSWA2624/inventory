# 311 — Delete a record

**Phase** 14 · Records  |  **Depends on** [301](301-record-lifecycle.md), [089](../04-data-layer/089-tombstones-table.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Soft delete with a tombstone and undo.

## Files

- `frontend/lib/features/records/presentation/record_delete_action.dart` (new)

## Steps

1. Confirm, tombstone, hide from lists, offer undo through the snackbar.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Files are retained until purge, so restore is always complete.
- [ ] Tests written and passing: Test of delete, undo and restore.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
