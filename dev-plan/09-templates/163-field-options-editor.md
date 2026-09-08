# 163 — Choice options editor

**Phase** 09 · Templates  |  **Depends on** [159](159-field-advanced-attributes.md)

## Goal

Manage option lists, with codes for export and aliases for AI mapping.

## Files

- `lib/features/templates/presentation/field_options_editor.dart` (new)

## Steps

1. Add, reorder, rename and retire options; renaming updates the label only, not stored codes.

## Acceptance

- [ ] Renaming an option does not silently rewrite historical records.
