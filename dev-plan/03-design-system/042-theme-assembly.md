# 042 — Assemble the Material 3 theme

**Phase** 03 · Design system  |  **Depends on** [038](038-color-tokens.md), [039](039-typography-scale.md), [040](040-spacing-tokens.md), [041](041-elevation-tokens.md)

## Goal

Turn the tokens into ThemeData for light and dark and install it in the app.

## Files

- `lib/app/theme/app_theme.dart` (new)

## Steps

1. Build ColorScheme, TextTheme and component themes for buttons, fields, chips, dialogs and app bars from tokens only.
2. Wire both themes into the root widget with system theme following.

## Acceptance

- [ ] Every stock Material widget already looks like Tapture without local styling.

## Tests

- Golden test of a sample screen in both themes.
