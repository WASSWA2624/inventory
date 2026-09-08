# 028 — Error boundary widget

**Phase** 02 · Project foundation  |  **Depends on** [025](025-result-and-failures.md), [023](023-app-bootstrap.md)

## Goal

Stop one broken subtree from taking down a screen.

## Files

- `lib/core/widgets/error_boundary.dart` (new)

## Steps

1. Catch build errors below the boundary and render the standard error state with a retry callback.

## Acceptance

- [ ] A thrown widget error shows a recoverable panel instead of a red screen.

## Tests

- Widget test with a deliberately throwing child.
