# 112 — Project folder service

**Phase** 05 · File storage  |  **Depends on** [111](111-storage-root.md), [088](../04-data-layer/088-projects-table.md)

## Goal

Create and resolve the per-project folder tree.

## Files

- `lib/core/files/project_folders.dart` (new)

## Steps

1. Create photos/, documents/, audio/, meetings/, reference/, templates/, exports/, imports/ on project creation.
2. Derive a stable folder name from the project name plus a short id suffix.

## Acceptance

- [ ] Renaming a project never moves or breaks existing files.

## Tests

- Unit test of tree creation and idempotency.
