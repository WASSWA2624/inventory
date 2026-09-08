# 086 — Audit log table

**Phase** 04 · Local database  |  **Depends on** [082](082-column-mixins.md), [084](084-transaction-helper.md)

## Goal

The local history that replaces a server audit trail.

## Files

- `lib/core/db/tables/audit_log.dart` (new)

## Steps

1. Columns: entityType, entityId, action, fieldKey, previousValue, newValue, reason, operator, device, at.
2. Provide an append helper callable from any repository inside a transaction.

## Acceptance

- [ ] Every value change in later phases writes exactly one audit row.

## Tests

- Unit test that an update writes previous and new values.
