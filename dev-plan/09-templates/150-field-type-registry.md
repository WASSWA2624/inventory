# 150 — Field type registry

**Phase** 09 · Templates  |  **Depends on** [149](149-template-model.md), [003](../01-orchestration/003-coding-standards.md)

## Goal

One registry describing each field type: its editor widget, validator, normaliser, storage form and export form.

## Files

- `lib/features/templates/domain/field_type_registry.dart` (new)

## Steps

1. Register every type from the specification with its four behaviours in one place.
2. Rule: adding a field type later means one registry entry, not edits across ten files.

## Acceptance

- [ ] Capture, review, validation and export all read behaviour from this registry.

## Tests

- Unit test that every declared type has all four behaviours.
