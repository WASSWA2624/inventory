# 044 — Theme mode controller

**Phase** 03 · Design system  |  **Depends on** [042](042-theme-assembly.md), [043](043-outdoor-theme.md)

## Goal

Persist and expose the chosen theme mode.

## Files

- `lib/app/theme/theme_controller.dart` (new)

## Steps

1. Store system, light, dark or outdoor; restore on launch.

## Acceptance

- [ ] The chosen mode survives a restart.

## Tests

- Unit test of persistence.
