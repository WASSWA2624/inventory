# 147 — Delete a project

**Phase** 08 · Projects  |  **Depends on** [146](146-project-archive.md), [085](../04-data-layer/085-tombstones-table.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Delete with a genuine confirmation, a tombstone and a recovery window.

## Files

- `lib/features/projects/presentation/project_delete_action.dart` (new)

## Steps

1. Require typing the project name; offer "Export first" in the same dialog.
2. Soft-delete rows and move files to the recycle area; purge only after the retention window.

## Acceptance

- [ ] A mistaken delete is recoverable for the retention period.

## Tests

- Test that delete writes tombstones and no files disappear immediately.
