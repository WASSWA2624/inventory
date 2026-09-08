# 165 — Output column mapping

**Phase** 09 · Templates  |  **Depends on** [157](157-field-list-editor.md)

## Goal

Set the spreadsheet column or generated header for each field.

## Files

- `lib/features/templates/presentation/output_mapping_screen.dart` (new)

## Steps

1. Auto-assign columns for templates built in the app; allow manual override for imported workbooks.

## Acceptance

- [ ] Two fields cannot claim the same column.

## Tests

- Unit test rejecting duplicate columns.
