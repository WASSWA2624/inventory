# 049 — Buttons

**Phase** 03 · Design system  |  **Depends on** [042](042-theme-assembly.md), [040](040-spacing-tokens.md)

## Goal

One button widget with primary, secondary, text and destructive variants, plus loading and disabled states.

## Files

- `lib/core/widgets/app_button.dart` (new)

## Steps

1. Implement variants from tokens; enforce the minimum touch target; show an inline spinner while busy.
2. Block double submission while the busy state is active.

## Acceptance

- [ ] No feature builds an ElevatedButton directly.

## Tests

- Golden tests per variant and state; widget test that a busy button ignores taps.
