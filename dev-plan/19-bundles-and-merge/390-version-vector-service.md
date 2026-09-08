# 390 — Version vector service

**Phase** 19 · Bundles and merge  |  **Depends on** [106](../04-data-layer/106-sync-state-table.md)

## Goal

Maintain and compare version vectors so merge can classify every entity.

## Files

- `lib/features/merge/domain/version_vectors.dart` (new)

## Steps

1. Update on every local write; compare as dominates, dominated or concurrent.

## Tests

- Unit tests over all three outcomes and empty vectors.
