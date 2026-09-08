# 324 — Identity hash computation

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [164](../09-templates/164-identity-fields.md), [031](../02-foundation/031-hashing-service.md), [093](../04-data-layer/093-records-table.md)

## Goal

Compute and store a stable hash of a record's identity values for fast duplicate lookup.

## Files

- `lib/features/quality/domain/identity_hash.dart` (new)

## Steps

1. Normalise case, whitespace and punctuation before hashing; recompute on identity edits.

## Acceptance

- [ ] Two records with the same serial always collide, whatever the spacing.

## Tests

- Unit tests over spacing and case variants.
