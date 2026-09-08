# 336 — Compute variance

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [335](335-verification-prefill.md), [102](../04-data-layer/102-variances-table.md)

## Goal

Compare as-recorded with as-found, field by field, on approval.

## Files

- `lib/features/quality/domain/variance_computation.dart` (new)

## Steps

1. Classify each field as MATCH, CHANGED or MISSING; recompute when values change.

## Acceptance

- [ ] The variance table matches the specification example.

## Tests

- Unit tests over changed, matching and empty values.
