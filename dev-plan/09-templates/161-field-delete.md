# 161 — Delete a field

**Phase** 09 · Templates  |  **Depends on** [157](157-field-list-editor.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Remove a field, retiring rather than destroying any values it already holds.

## Files

- `lib/features/templates/presentation/field_delete_action.dart` (new)

## Steps

1. Warn with the count of records holding a value; mark values retired instead of deleting them.

## Acceptance

- [ ] Deleting a field never loses captured data.

## Tests

- Test that retired values survive and export as retired.
