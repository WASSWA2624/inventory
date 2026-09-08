# 045 — Breakpoints and responsive helpers

**Phase** 03 · Design system  |  **Depends on** [010](../01-orchestration/010-responsiveness-policy.md), [040](040-spacing-tokens.md)

## Goal

One source of truth for size classes and a helper that resolves values per class.

## Files

- `lib/core/widgets/responsive/breakpoints.dart` (new)

## Steps

1. Define compact, medium and expanded; expose a context extension and a value resolver.

## Acceptance

- [ ] No widget compares MediaQuery width directly after this task.

## Tests

- Unit test of resolution at boundary widths.
