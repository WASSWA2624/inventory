# 393 — Field-level merge

**Phase** 19 · Bundles and merge  |  **Depends on** [392](392-merge-entity-level.md), [094](../04-data-layer/094-record-fields-table.md)

## Goal

Merge concurrent records field by field.

## Files

- `lib/features/merge/domain/merge_fields.dart` (new)

## Steps

1. One-sided changes apply; identical values are not conflicts; differing values escalate.

## Tests

- Unit tests over all three cases.
