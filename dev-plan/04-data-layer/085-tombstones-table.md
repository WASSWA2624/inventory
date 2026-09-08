# 085 — Tombstones table

**Phase** 04 · Local database  |  **Depends on** [082](082-column-mixins.md), [013](../01-orchestration/013-data-safety-rules.md)

## Goal

Record deletions so they survive merge instead of being resurrected.

## Files

- `lib/core/db/tables/tombstones.dart` (new)

## Steps

1. Columns: entityType, entityId, deletedAt, deletedByDevice, reason.
2. Provide a helper that writes a tombstone inside the same transaction as the delete.

## Acceptance

- [ ] Deleting any entity always produces exactly one tombstone.

## Tests

- Unit test for delete plus tombstone atomicity.
