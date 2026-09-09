# 047 — High-contrast outdoor theme

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A third theme for direct sunlight, selectable in settings.

## Files

- `frontend/lib/app/theme/outdoor_theme.dart` (new)

## Contract

```dart
ThemeData buildOutdoorTheme(Brightness brightness);
```

## Steps

1. Raise contrast, thicken outlines and remove low-contrast surface tints while keeping the same token names.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Switching to outdoor mode changes no layout, only contrast.
- [ ] Tests written and passing: Unit test asserting every token in `outdoor_theme.dart` is defined in light, dark and outdoor.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
