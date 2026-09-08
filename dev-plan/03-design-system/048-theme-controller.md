# 048 — Theme mode controller

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md), [047](047-outdoor-theme.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Persist and expose the chosen theme mode.

## Files

- `lib/app/theme/theme_controller.dart` (new)

## Contract

```dart
enum AppThemeMode { system, light, dark, outdoor }
final themeModeProvider = NotifierProvider<ThemeModeController, AppThemeMode>(...);
```

## Steps

1. Store system, light, dark or outdoor; restore on launch.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The chosen mode survives a restart.
- [ ] Tests written and passing: Unit test of persistence.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
