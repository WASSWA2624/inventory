# 097 — Captions table

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md), [095](095-photos-table.md)

## Goal

Record-level and photo-level captions, raw and refined, each independently editable.

## Files

- `lib/core/db/tables/captions.dart` (new)

## Steps

1. Columns: ownerType (record or photo), ownerId, textRaw, textRefined, inputMode (typed or spoken), refinedAt.

## Acceptance

- [ ] Applying one caption to many photos writes one row per photo.

## Tests

- DAO test for the many-photo write.
