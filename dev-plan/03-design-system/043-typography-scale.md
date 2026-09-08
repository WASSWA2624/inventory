# 043 — Typography scale

**Phase** 03 · Design system  |  **Depends on** [042](042-color-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One type ramp with semantic names, sized for outdoor reading.

## Files

- `lib/app/theme/typography.dart` (new)

## Contract

```dart
abstract final class AppText { static TextStyle display, title, section, body, bodyStrong, label, caption, mono; }
```

## Steps

1. Define display, title, section, body, bodyStrong, label, caption and mono roles with weights and line heights.
2. Verify each role at 200 percent text scale without clipping.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No widget constructs a TextStyle inline after this task.
- [ ] Tests written and passing: Golden test of the ramp at default and doubled text scale.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
