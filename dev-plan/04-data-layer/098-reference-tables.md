# 098 — Reference dataset tables

**Phase** 04 · Local database  |  **Depends on** [088](088-projects-table.md)

## Goal

Imported lookup tables and their rows.

## Files

- `lib/core/db/tables/reference.dart` (new)

## Steps

1. Datasets: name, scope, keyColumn, columns JSON, sourceFile, importedAt. Rows: datasetId, keyValue, values JSON.
2. Index on datasetId plus keyValue, and a normalised name column for fuzzy matching.
