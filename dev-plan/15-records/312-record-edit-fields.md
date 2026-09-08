# 312 — Edit a saved record's fields

**Phase** 15 · Records  |  **Depends on** [311](311-record-detail.md), [296](../14-review/296-field-editor-inline.md)

## Goal

Change values after saving, with history and status consequences.

## Files

- `lib/features/records/presentation/record_edit_screen.dart` (new)

## Steps

1. Editing an approved record returns it to NEEDS_REVIEW and writes an audit entry.

## Acceptance

- [ ] Nothing about a record is permanently frozen.

## Tests

- Test of the status transition on edit.
