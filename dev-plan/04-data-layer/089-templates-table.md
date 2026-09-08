# 089 — Templates table

**Phase** 04 · Local database  |  **Depends on** [088](088-projects-table.md)

## Goal

Store template definitions, their source and their version.

## Files

- `lib/core/db/tables/templates.dart` (new)

## Steps

1. Columns: projectId nullable for shipped entries, name, kind, source, sourceFilePath, sheetName, headerRow, identityFields, detection, version.
