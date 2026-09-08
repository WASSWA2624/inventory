# 186 — Edit a dataset row

**Phase** 10 · Reference data and lookups  |  **Depends on** [185](185-dataset-browser.md), [074](../03-design-system/074-app-form-scaffold.md)

## Goal

Correct reference data in place.

## Files

- `lib/features/reference/presentation/dataset_row_edit_screen.dart` (new)

## Steps

1. Record the edit in the audit log; do not retroactively change records already prefilled.

## Acceptance

- [ ] Fixing a supplier's phone number does not silently rewrite history.
