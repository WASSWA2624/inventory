# 198 — Context bar widget

**Phase** 11 · Context fields  |  **Depends on** [197](197-context-persistence.md), [059](../03-design-system/059-app-chip.md), [127](../06-app-shell/127-status-line.md)

## Goal

The always-visible breadcrumb of pinned values.

## Files

- `lib/features/context/presentation/context_bar.dart` (new)

## Steps

1. Render levels as chips with separators; truncate gracefully on narrow screens; tap to change.

## Acceptance

- [ ] The bar fits a small phone without wrapping into three lines.

## Tests

- Golden test at three widths with long facility names.
