# 180 — Import a dataset from CSV

**Phase** 10 · Reference data and lookups  |  **Depends on** [179](179-dataset-model.md), [122](../05-file-storage/122-file-validation.md)

## Goal

Read a CSV into a dataset with a chosen key column.

## Files

- `lib/features/reference/data/dataset_csv_import.dart` (new)

## Steps

1. Handle delimiter detection, quoted values, byte-order marks and blank rows.

## Acceptance

- [ ] A ten-thousand-row file imports without freezing the interface.

## Tests

- Test over awkward CSV fixtures.
