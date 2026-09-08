# 381 — Export versioning and folders

**Phase** 18 · Export  |  **Depends on** [380](380-export-history.md), [112](../05-file-storage/112-project-folder-service.md)

## Goal

Versioned, dated folders that are never overwritten.

## Files

- `lib/features/exports/domain/export_versioning.dart` (new)

## Steps

1. Allocate v1, v2 and so on per project, in dated directories.

## Acceptance

- [ ] A new export never destroys a previous one.
