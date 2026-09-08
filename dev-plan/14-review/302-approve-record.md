# 302 — Approve and next

**Phase** 14 · Review and approval  |  **Depends on** [294](294-review-screen.md), [320](../16-data-quality/320-validation-engine.md), [306](../15-records/306-record-lifecycle.md)

## Goal

The primary action: validate, approve, and jump to the next record needing review.

## Files

- `lib/features/review/domain/approve_record.dart` (new)

## Steps

1. Block approval on failed validation, unresolved duplicates and unresolved conflicts, naming what to fix.

## Acceptance

- [ ] Approving moves straight to the next unreviewed record.

## Tests

- Test of the block conditions.
