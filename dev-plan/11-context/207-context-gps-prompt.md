# 207 — Optional movement prompt

**Phase** 11 · Context fields  |  **Depends on** [206](206-context-auto-clear.md), [035](../02-foundation/035-permissions-service.md)

## Goal

Ask the operator to confirm the context after moving a configured distance.

## Files

- `lib/features/context/domain/context_movement_prompt.dart` (new)

## Steps

1. Off by default and only active when GPS is already enabled.

## Acceptance

- [ ] No location is read when the feature is off.
