# 295 — Attention-first field ordering

**Phase** 14 · Review and approval  |  **Depends on** [294](294-review-screen.md), [280](../13-processing/280-confidence-banding.md)

## Goal

Sort low-confidence, missing, conflicting and duplicate-flagged fields to the top.

## Files

- `lib/features/review/domain/field_ordering.dart` (new)

## Steps

1. Collapse confident fields under a single expandable group.

## Acceptance

- [ ] The common case is a glance and a tap.

## Tests

- Unit test of ordering rules.
