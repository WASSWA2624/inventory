# 404 — Undo a merge

**Phase** 19 · Bundles and merge  |  **Depends on** [403](403-merge-history.md), [402](402-merge-apply.md)

## Goal

Restore the pre-merge state from the snapshot.

## Files

- `lib/features/merge/domain/merge_undo.dart` (new)

## Steps

1. Available until the snapshot is purged; state the deadline in the interface.

## Acceptance

- [ ] Undo restores rows and files exactly, including deleted ones.

## Tests

- Test comparing state before merge and after undo.
