# 326 — Duplicate prompt on save

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [325](325-duplicate-detection.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Warn at the moment of saving, with the four choices from the specification.

## Files

- `lib/features/quality/presentation/duplicate_prompt.dart` (new)

## Steps

1. Offer Override existing, Keep both, Discard new and Merge fields.

## Acceptance

- [ ] The prompt never appears without showing the differing values.
