# 279 — Match to a predefined row

**Phase** 13 · Processing pipeline  |  **Depends on** [175](../09-templates/175-predefined-rows-import.md), [176](../09-templates/176-row-aliases-editor.md), [277](277-normalise-choices.md)

## Goal

Exact, alias, normalised, fuzzy, then model classification, in that order.

## Files

- `lib/features/processing/domain/row_matching.dart` (new)

## Steps

1. Stop at the first confident match; record which strategy matched and its score.

## Acceptance

- [ ] "Sphygmomanometer" reaches "Blood Pressure Machine" without a model call.

## Tests

- Unit tests for each strategy.
