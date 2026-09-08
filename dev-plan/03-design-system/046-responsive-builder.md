# 046 — Responsive layout builder

**Phase** 03 · Design system  |  **Depends on** [045](045-breakpoints.md)

## Goal

A builder that hands each size class its own layout without duplicating widgets.

## Files

- `lib/core/widgets/responsive/responsive_builder.dart` (new)

## Steps

1. Provide compact, medium and expanded builders with sensible fallback to the smaller class.

## Acceptance

- [ ] Two-pane layouts become a one-line change in a screen.

## Tests

- Widget test at three widths.
