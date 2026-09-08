# 398 — Relabel colliding record numbers

**Phase** 19 · Bundles and merge  |  **Depends on** [392](392-merge-entity-level.md), [243](../12-capture/243-record-number-sequence.md)

## Goal

Keep human-facing numbers unique after a merge without touching identifiers.

## Files

- `lib/features/merge/domain/merge_numbering.dart` (new)

## Acceptance

- [ ] No reference breaks, because identity is the UUID, not the number.
