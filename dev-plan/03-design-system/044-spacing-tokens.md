# 044 — Spacing, radius and size tokens

**Phase** 03 · Design system  |  **Depends on** [042](042-color-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A four-point spacing scale, corner radii and standard control heights.

## Files

- `frontend/lib/app/theme/dimensions.dart` (new)

## Contract

```dart
abstract final class Space { static const x1 = 4.0, x2 = 8.0, x3 = 12.0, x4 = 16.0, x6 = 24.0, x8 = 32.0; }
abstract final class Radii { static const sm, md, lg, pill; }
abstract final class Sizes { static const minTapTarget = 48.0, controlHeight = 52.0; }
```

## Steps

1. Define space values from 2 to 48, radii small/medium/large/pill, control heights and the 48dp minimum touch target.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Padding and radius literals disappear from feature code.
- [ ] Tests written and passing: Unit test asserting every token in `dimensions.dart` is defined in light, dark and outdoor.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
