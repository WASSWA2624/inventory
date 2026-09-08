# 109 — Database integrity check

**Phase** 04 · Local database  |  **Depends on** [081](081-migration-strategy.md), [084](084-transaction-helper.md)

## Goal

A startup check that catches orphaned rows and missing files early.

## Files

- `lib/core/db/integrity_check.dart` (new)

## Steps

1. Detect record fields without a record, photos whose file is missing, and jobs referencing deleted records.
2. Report findings to a maintenance screen rather than deleting anything automatically.

## Acceptance

- [ ] A corrupted state is reported, never silently repaired.

## Tests

- Unit test with deliberately orphaned rows.
