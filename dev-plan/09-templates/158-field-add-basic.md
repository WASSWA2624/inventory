# 158 — Add a field: label, type, required

**Phase** 09 · Templates  |  **Depends on** [157](157-field-list-editor.md), [150](150-field-type-registry.md), [055](../03-design-system/055-app-choice-field.md)

## Goal

The three-question add flow, with everything else defaulted.

## Files

- `lib/features/templates/presentation/field_add_sheet.dart` (new)

## Steps

1. Generate the field key from the label, guaranteeing uniqueness and stability.

## Acceptance

- [ ] A field can be added in under ten seconds.

## Tests

- Test of key generation and collision handling.
