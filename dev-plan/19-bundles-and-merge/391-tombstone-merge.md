# 391 — Tombstone propagation

**Phase** 19 · Bundles and merge  |  **Depends on** [390](390-version-vector-service.md), [085](../04-data-layer/085-tombstones-table.md)

## Goal

Apply and respect deletions across devices without resurrecting data.

## Files

- `lib/features/merge/domain/tombstone_merge.dart` (new)

## Steps

1. A delete wins over an older edit; an edit after the delete raises a conflict rather than resurrecting silently.

## Acceptance

- [ ] No merge ever brings back an entity deliberately deleted later.

## Tests

- Unit tests over both orderings.
