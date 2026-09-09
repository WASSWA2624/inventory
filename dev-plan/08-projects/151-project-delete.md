# 151 — Delete a project

**Phase** 08 · Projects  |  **Depends on** [150](150-project-archive.md), [089](../04-data-layer/089-tombstones-table.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Delete with a genuine confirmation, a tombstone and a recovery window.

## Files

- `frontend/lib/features/projects/presentation/project_delete_action.dart` (new)

## Steps

1. Require typing the project name; offer "Export first" in the same dialog.
2. Soft-delete rows and move files to the recycle area; purge only after the retention window.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A mistaken delete is recoverable for the retention period.
- [ ] Tests written and passing: Test that delete writes tombstones and no files disappear immediately.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
