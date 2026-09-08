# 211 — Capture screen shell

**Phase** 12 · Capture  |  **Depends on** [210](210-capture-session-controller.md), [048](../03-design-system/048-app-page.md), [198](../11-context/198-context-bar.md), [051](../03-design-system/051-app-primary-action.md)

## Goal

Assemble the screen from the specification: context bar, photo tray, caption, identifier, two save actions.

## Files

- `lib/features/capture/presentation/capture_screen.dart` (new)

## Steps

1. Lay out for compact first; on medium and expanded show the tray and form side by side.
2. Both primary actions are reachable with one thumb on a phone.

## Acceptance

- [ ] Nothing on the screen is mandatory except one piece of evidence.

## Tests

- Widget test at three widths.
