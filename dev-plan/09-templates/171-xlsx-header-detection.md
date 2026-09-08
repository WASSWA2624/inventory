# 171 — Detect the header row

**Phase** 09 · Templates  |  **Depends on** [170](170-xlsx-read-workbook.md)

## Goal

Find the header row automatically and let the user correct it.

## Files

- `lib/core/import/header_detection.dart` (new)

## Steps

1. Score candidate rows by text density and uniqueness; show the chosen row for confirmation.

## Acceptance

- [ ] A workbook with a title block above the header still maps correctly.

## Tests

- Unit tests over fixtures with and without title rows.
