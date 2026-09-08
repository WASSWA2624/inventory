# 316 — Delete a record

**Phase** 15 · Records  |  **Depends on** [306](306-record-lifecycle.md), [085](../04-data-layer/085-tombstones-table.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Soft delete with a tombstone and undo.

## Files

- `lib/features/records/presentation/record_delete_action.dart` (new)

## Steps

1. Confirm, tombstone, hide from lists, offer undo through the snackbar.

## Acceptance

- [ ] Files are retained until purge, so restore is always complete.

## Tests

- Test of delete, undo and restore.
