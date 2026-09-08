# 172 — Infer field types from columns

**Phase** 09 · Templates  |  **Depends on** [171](171-xlsx-header-detection.md), [150](150-field-type-registry.md)

## Goal

Suggest a type, unit and option list per column from its sample values.

## Files

- `lib/core/import/type_inference.dart` (new)

## Steps

1. Detect numbers, dates, booleans, small option sets and identifier patterns.

## Acceptance

- [ ] Suggestions are visibly suggestions, always editable.

## Tests

- Unit tests over mixed sample columns.
