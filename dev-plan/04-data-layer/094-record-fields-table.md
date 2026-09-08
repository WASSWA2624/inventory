# 094 — Record fields table

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md)

## Goal

One row per field per record, carrying raw, refined, final and provenance.

## Files

- `lib/core/db/tables/record_fields.dart` (new)

## Steps

1. Columns: recordId, fieldKey, valueRaw, valueRefined, valueFinal, confidence, source, verified, verifiedBy, verifiedAt plus the change-tracking columns.
2. Unique index on recordId plus fieldKey; index on fieldKey plus valueFinal for search.

## Acceptance

- [ ] Raw and refined are separate columns from the first migration, never one column.

## Tests

- DAO test that writing refined leaves raw untouched.
