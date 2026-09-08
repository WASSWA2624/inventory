# 395 — Merge photos by content hash

**Phase** 19 · Bundles and merge  |  **Depends on** [392](392-merge-entity-level.md), [095](../04-data-layer/095-photos-table.md)

## Goal

Union photo sets, storing identical content once.

## Files

- `lib/features/merge/domain/merge_photos.dart` (new)

## Steps

1. Match on SHA-256; merge captions per field; keep the importing device's order and append new photos.

## Acceptance

- [ ] The same photo imported twice occupies one file.

## Tests

- Test asserting a single stored file.
