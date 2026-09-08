# 357 — Pre-export validation

**Phase** 18 · Export  |  **Depends on** [320](../16-data-quality/320-validation-engine.md), [355](355-export-scope.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

List incomplete or unapproved records and offer the three choices.

## Files

- `lib/features/exports/domain/export_validation.dart` (new)

## Steps

1. Offer Fix now, Exclude them, or Export anyway marked incomplete.

## Acceptance

- [ ] An export marked incomplete says so inside the file itself.

## Tests

- Test of all three paths.
