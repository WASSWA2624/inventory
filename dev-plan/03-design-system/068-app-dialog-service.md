# 068 — Dialog service

**Phase** 03 · Design system  |  **Depends on** [049](049-app-button.md), [042](042-theme-assembly.md)

## Goal

Alert, confirm and destructive dialogs through one API, never constructed ad hoc.

## Files

- `lib/core/widgets/feedback/app_dialog.dart` (new)

## Steps

1. Destructive variant requires an explicit action label and returns a typed result.

## Acceptance

- [ ] Delete flows across the app look and behave identically.

## Tests

- Widget tests for confirm and cancel paths.
