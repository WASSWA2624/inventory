# 082 — Shared column mixins

**Phase** 04 · Local database  |  **Depends on** [080](080-drift-setup.md), [030](../02-foundation/030-uuid-service.md), [029](../02-foundation/029-clock-service.md)

## Goal

The identity and change-tracking columns every table shares, defined once.

## Files

- `lib/core/db/columns.dart` (new)

## Steps

1. Provide id (UUIDv7 text), createdAt, updatedAt, updatedByDevice and rev.
2. Provide a helper that bumps rev and updatedAt on every write.

## Acceptance

- [ ] No table declares these columns by hand.

## Tests

- Unit test that the write helper always bumps rev.
