# 081 — User-facing copy helper

**Phase** 03 · Design system  |  **Depends on** [011](../01-orchestration/011-naming-checker.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Route every string through one place, ready for translation and consistent tone.

## Files

- `frontend/lib/core/copy/copy.dart` (new)

## Contract

```dart
abstract final class Copy { static String get notDetected; static String recordsCount(int n); }
```

## Steps

1. Define the tone rules: plain language, no jargon, "Not detected" rather than null.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/04-theming.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No inline user-facing string remains in a catalogue widget.
- [ ] Tests written and passing: Unit tests of `copy.dart` against its fake.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
