# 084 — Transaction helper

**Phase** 04 · Local database  |  **Depends on** [083](083-dao-conventions.md)

## Goal

Multi-table writes that either fully apply or fully roll back.

## Files

- `lib/core/db/transactions.dart` (new)

## Steps

1. Wrap Drift transactions with failure mapping and nested-call safety.

## Acceptance

- [ ] Import, merge and approval flows are atomic.

## Tests

- Test that a failure mid-transaction leaves no partial rows.
