# 105 — Merge session and conflict tables

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md), [082](082-column-mixins.md)

## Goal

Persist bundle imports, their conflicts and enough state to undo a merge.

## Files

- `lib/core/db/tables/merge.dart` (new)

## Steps

1. Sessions: bundleName, sourceDevice, importedAt, counts JSON, status, undoSnapshotPath.
2. Conflicts: sessionId, entityType, entityId, fieldKey, mineValue, theirsValue, mineMeta, theirsMeta, resolution, resolvedAt.
