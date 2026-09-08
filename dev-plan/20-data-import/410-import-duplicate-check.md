# 410 — Duplicate check during import

**Phase** 20 · Importing existing data  |  **Depends on** [409](409-import-records-create.md), [325](../16-data-quality/325-duplicate-detection.md)

## Goal

Compare each incoming row against existing records before inserting.

## Files

- `lib/features/import/domain/import_duplicates.dart` (new)

## Steps

1. Offer Keep existing, Replace, Merge, and an apply-to-all option.

## Acceptance

- [ ] No import silently overwrites an existing record.

## Tests

- Test of each choice.
