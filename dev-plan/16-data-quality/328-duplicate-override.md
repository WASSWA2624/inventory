# 328 — Override an existing record

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [327](327-duplicate-compare.md), [086](../04-data-layer/086-audit-table.md)

## Goal

Replace the existing values with the new ones, only after the comparison has been shown.

## Files

- `lib/features/quality/domain/duplicate_override.dart` (new)

## Steps

1. Preserve previous values in history; write an audit entry naming the override; attach the new photos.

## Acceptance

- [ ] Overriding is impossible without passing through human review.

## Tests

- Test that history contains the replaced values.
