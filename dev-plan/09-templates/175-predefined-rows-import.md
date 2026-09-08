# 175 — Import predefined rows

**Phase** 09 · Templates  |  **Depends on** [174](174-xlsx-template-create.md), [091](../04-data-layer/091-template-rows-table.md)

## Goal

Read existing spreadsheet rows into the checklist the operator works through.

## Files

- `lib/features/templates/data/predefined_rows_import.dart` (new)

## Steps

1. Map the identifier and label columns; keep the original row number for write-back.

## Acceptance

- [ ] Rows import with their spreadsheet positions preserved.
