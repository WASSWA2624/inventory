# 402 — Apply the merge atomically

**Phase** 19 · Bundles and merge  |  **Depends on** [399](399-merge-preview.md), [400](400-conflict-screen.md), [084](../04-data-layer/084-transaction-helper.md)

## Goal

Write everything in one transaction, with a snapshot taken first.

## Files

- `lib/features/merge/domain/merge_apply.dart` (new)

## Steps

1. Take an undo snapshot before writing; roll back completely on any failure.

## Acceptance

- [ ] A failed merge leaves the project exactly as it was.

## Tests

- Test simulating a mid-merge failure.
