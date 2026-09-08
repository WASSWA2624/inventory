# 104 — Exports table

**Phase** 04 · Local database  |  **Depends on** [088](088-projects-table.md)

## Goal

Export history: what was produced, from which records, with which options.

## Files

- `lib/core/db/tables/exports.dart` (new)

## Steps

1. Columns: projectId, version, formats, filters JSON, recordCount, filePath, fileHash, createdAt, createdBy.
