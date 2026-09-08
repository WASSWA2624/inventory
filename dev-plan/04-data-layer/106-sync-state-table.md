# 106 — Version vector table

**Phase** 04 · Local database  |  **Depends on** [105](105-merge-tables.md), [082](082-column-mixins.md)

## Goal

Track, per entity, the highest revision seen from every device.

## Files

- `lib/core/db/tables/sync_state.dart` (new)

## Steps

1. Columns: entityType, entityId, deviceId, rev; unique on the triple.
2. Provide helpers to compare two vectors as dominates, dominated or concurrent.

## Acceptance

- [ ] Merge can classify any incoming entity without scanning history.

## Tests

- Unit tests for all three comparison outcomes.
