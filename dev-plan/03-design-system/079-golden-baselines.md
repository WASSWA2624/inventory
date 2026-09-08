# 079 — Golden test baselines for the catalogue

**Phase** 03 · Design system  |  **Depends on** [078](078-widget-gallery.md), [009](../01-orchestration/009-testing-policy.md)

## Goal

Lock the appearance of the design system so drift is caught by tests.

## Files

- `test/design_system/goldens/` (new)

## Steps

1. Generate goldens for every catalogue widget in light, dark and outdoor themes.

## Acceptance

- [ ] A styling change that was not intended fails the test suite.

## Tests

- Golden suite runs in continuous integration.
