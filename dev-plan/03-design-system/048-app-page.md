# 048 — Page scaffold

**Phase** 03 · Design system  |  **Depends on** [042](042-theme-assembly.md), [047](047-content-constraint.md)

## Goal

The standard page frame: title, actions, safe areas, scroll behaviour and error boundary.

## Files

- `lib/core/widgets/app_page.dart` (new)

## Steps

1. Compose app bar, optional subtitle line, body slot, footer action slot and pull-to-refresh hook.
2. Apply the content constraint and the responsive padding automatically.

## Acceptance

- [ ] Every screen in later phases uses this and none builds its own Scaffold.

## Tests

- Golden test in both themes and three widths.
