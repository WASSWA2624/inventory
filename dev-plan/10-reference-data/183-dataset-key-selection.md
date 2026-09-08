# 183 — Choose the key column

**Phase** 10 · Reference data and lookups  |  **Depends on** [180](180-dataset-import-csv.md), [055](../03-design-system/055-app-choice-field.md)

## Goal

Pick the column that identifies a row, warning about duplicates.

## Files

- `lib/features/reference/presentation/dataset_key_screen.dart` (new)

## Steps

1. Show duplicate key counts before import completes.

## Acceptance

- [ ] A dataset with a non-unique key cannot be saved silently.
