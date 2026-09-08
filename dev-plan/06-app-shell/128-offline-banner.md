# 128 — Offline banner wiring

**Phase** 06 · Application shell  |  **Depends on** [127](127-status-line.md), [071](../03-design-system/071-app-banner.md)

## Goal

Show the offline explanation from the specification, not an error.

## Files

- `lib/app/widgets/offline_banner.dart` (new)

## Steps

1. Appear on transition to offline, dismissible, reappearing only on the next transition.

## Acceptance

- [ ] Going offline never interrupts capture with a dialog.
