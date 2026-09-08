# 436 — Accessibility audit

**Phase** 23 · Hardening  |  **Depends on** [011](../01-orchestration/011-accessibility-policy.md), [078](../03-design-system/078-widget-gallery.md)

## Goal

Verify semantics, focus order, labels and contrast across the app.

## Files

- `test/accessibility/` (new)

## Steps

1. Run the accessibility guidelines checks in widget tests for every primary screen.

## Acceptance

- [ ] Every interactive element has a label and meets the tap target minimum.

## Tests

- Automated accessibility assertions in the suite.
