# 202 — Per-record override

**Phase** 11 · Context fields  |  **Depends on** [201](201-context-apply-to-record.md)

## Goal

Editing a context value on one record changes that record only.

## Files

- `lib/features/context/domain/context_override.dart` (new)

## Steps

1. Mark the field as overridden and leave the project context untouched.

## Acceptance

- [ ] Correcting one record's department does not move the operator's context.

## Tests

- Test that the project context is unchanged after an override.
