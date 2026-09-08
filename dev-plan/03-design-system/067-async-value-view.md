# 067 — Async value view

**Phase** 03 · Design system  |  **Depends on** [066](066-app-loading-state.md), [065](065-app-error-state.md), [064](064-app-empty-state.md)

## Goal

One widget that renders loading, error, empty and data for any async provider.

## Files

- `lib/core/widgets/async_value_view.dart` (new)

## Steps

1. Accept builders for data and empty, defaulting the other two to the shared states.

## Acceptance

- [ ] Feature screens contain no manual state switches.

## Tests

- Widget test across all four states.
