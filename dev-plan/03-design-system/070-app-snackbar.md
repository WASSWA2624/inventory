# 070 — Snackbar and toast service

**Phase** 03 · Design system  |  **Depends on** [042](042-theme-assembly.md)

## Goal

Short confirmations with an optional undo action.

## Files

- `lib/core/widgets/feedback/app_snackbar.dart` (new)

## Steps

1. Queue messages so they do not overlap; expose success, warning and error styles with an undo slot.

## Acceptance

- [ ] Every destructive action can offer undo through this one call.

## Tests

- Widget test that undo invokes the callback.
