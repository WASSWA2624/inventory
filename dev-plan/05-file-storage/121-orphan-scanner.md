# 121 — Orphan file scanner

**Phase** 05 · File storage  |  **Depends on** [109](../04-data-layer/109-db-integrity-check.md), [112](112-project-folder-service.md)

## Goal

Find files with no database row and rows with no file.

## Files

- `lib/core/files/orphan_scanner.dart` (new)

## Steps

1. Report both directions with sizes; offer adoption for orphan files and evidence-missing flags for missing files.

## Acceptance

- [ ] Nothing is deleted without explicit user choice.

## Tests

- Test with a deliberately orphaned file and row.
