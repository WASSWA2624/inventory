# 042 — Colour tokens for light and dark

**Phase** 03 · Design system  |  **Depends on** [013](../01-orchestration/013-reuse-policy.md), [023](../02-foundation/023-app-bootstrap.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Define the full colour palette as named tokens, resolved for light and dark, with no literal colours anywhere else.

## Files

- `lib/app/theme/color_tokens.dart` (new)

## Contract

```dart
abstract final class AppColors { final Color surface, background, outline, primary, onPrimary, danger, warning, success, info; }
extension AppColorsX on BuildContext { AppColors get colors; }
```

## Steps

1. Define surface, surfaceVariant, background, outline, primary, onPrimary, secondary, danger, warning, success, info and the confidence band colours.
2. Provide light and dark values for every token; no token may be defined only in one mode.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Switching the system theme changes every screen with no per-widget work.
- [ ] Tests written and passing: Unit test that both maps define the same key set.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
