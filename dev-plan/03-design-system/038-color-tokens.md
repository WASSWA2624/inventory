# 038 — Colour tokens for light and dark

**Phase** 03 · Design system  |  **Depends on** [005](../01-orchestration/005-reuse-policy.md), [023](../02-foundation/023-app-bootstrap.md)

## Goal

Define the full colour palette as named tokens, resolved for light and dark, with no literal colours anywhere else.

## Files

- `lib/app/theme/color_tokens.dart` (new)

## Steps

1. Define surface, surfaceVariant, background, outline, primary, onPrimary, secondary, danger, warning, success, info and the confidence band colours.
2. Provide light and dark values for every token; no token may be defined only in one mode.

## Acceptance

- [ ] Switching the system theme changes every screen with no per-widget work.

## Tests

- Unit test that both maps define the same key set.
