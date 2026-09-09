# 046 — Assemble the Material 3 theme

**Phase** 03 · Design system  |  **Depends on** [042](042-color-tokens.md), [043](043-typography-scale.md), [044](044-spacing-tokens.md), [045](045-elevation-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn the tokens into ThemeData for light and dark and install it in the app.

## Files

- `frontend/lib/app/theme/app_theme.dart` (new)

## Contract

```dart
ThemeData buildTheme({required Brightness brightness, bool outdoor = false});
```

## Steps

1. Build ColorScheme, TextTheme and component themes for buttons, fields, chips, dialogs and app bars from tokens only.
2. Wire both themes into the root widget with system theme following.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every stock Material widget already looks like Tapture without local styling.
- [ ] Tests written and passing: Golden test of a sample screen in both themes.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
