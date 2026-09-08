# 065 — Error state

**Phase** 03 · Design system  |  **Depends on** [064](064-app-empty-state.md), [025](../02-foundation/025-result-and-failures.md)

## Goal

Render a Failure as a recoverable panel with a retry action.

## Files

- `lib/core/widgets/states/app_error_state.dart` (new)

## Steps

1. Map each failure type to its plain-language message and suggested action.

## Acceptance

- [ ] No screen shows a raw exception string.

## Tests

- Widget test for each failure type.
