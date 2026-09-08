# 296 — Edit a field inline

**Phase** 14 · Review and approval  |  **Depends on** [294](294-review-screen.md), [150](../09-templates/150-field-type-registry.md)

## Goal

Tap any value to edit it with the right editor for its type.

## Files

- `lib/features/review/presentation/field_editor.dart` (new)

## Steps

1. On edit, set source MANUAL, mark verified, and write an audit entry with the previous value.

## Acceptance

- [ ] Every correction is recorded with what it replaced.

## Tests

- Test asserting the audit row.
