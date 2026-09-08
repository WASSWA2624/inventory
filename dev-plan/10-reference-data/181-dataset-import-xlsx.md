# 181 — Import a dataset from a spreadsheet

**Phase** 10 · Reference data and lookups  |  **Depends on** [180](180-dataset-import-csv.md), [170](../09-templates/170-xlsx-read-workbook.md)

## Goal

Reuse the workbook reader to import a sheet as a dataset.

## Files

- `lib/features/reference/data/dataset_xlsx_import.dart` (new)

## Reuse

- Uses the workbook reader and header detection from the template phase.
