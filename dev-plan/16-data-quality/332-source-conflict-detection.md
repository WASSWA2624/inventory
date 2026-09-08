# 332 — Detect source conflicts

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [272](../13-processing/272-proposal-application.md), [281](../13-processing/281-evidence-linking.md)

## Goal

Flag a field when independent sources give different values.

## Files

- `lib/features/quality/domain/conflict_detection.dart` (new)

## Steps

1. Compare OCR, caption, reference and barcode candidates after normalisation.

## Acceptance

- [ ] A conflict is raised only after normalisation, not for formatting differences.

## Tests

- Unit tests over the specification example.
