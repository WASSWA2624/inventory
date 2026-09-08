# 409 — Create records from rows

**Phase** 20 · Importing existing data  |  **Depends on** [408](408-import-records-mapping.md), [305](../15-records/305-record-model.md), [084](../04-data-layer/084-transaction-helper.md)

## Goal

Insert rows as records with source IMPORTED_TABLE, in one transaction with progress.

## Files

- `lib/features/import/domain/record_import.dart` (new)

## Steps

1. Apply validation per row; collect failures rather than aborting the whole import.

## Acceptance

- [ ] Ten thousand rows import without freezing the interface.

## Tests

- Test over a fixture with some invalid rows.
