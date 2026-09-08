# 124 — Adaptive navigation shell

**Phase** 06 · Application shell  |  **Depends on** [123](123-router-setup.md), [046](../03-design-system/046-responsive-builder.md), [048](../03-design-system/048-app-page.md)

## Goal

The four-destination shell: bottom bar on compact, rail on medium, rail plus list pane on expanded.

## Files

- `lib/app/nav_shell.dart` (new)

## Steps

1. Destinations: Projects, Capture, Records, More, with Capture visually dominant.
2. Preserve each tab's navigation stack across switches.

## Acceptance

- [ ] Rotating a tablet moves the navigation without losing state.

## Tests

- Widget test at three widths.
