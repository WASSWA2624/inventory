# 069 — Error state

**Phase** 03 · Design system  |  **Depends on** [068](068-app-empty-state.md), [026](../02-foundation/026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Render a Failure as a recoverable panel with a retry action.

## Files

- `lib/core/widgets/states/app_error_state.dart` (new)

## Contract

```dart
class AppErrorState extends StatelessWidget { final Failure failure; final VoidCallback? onRetry; }
```

## Steps

1. Map each failure type to its plain-language message and suggested action.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No screen shows a raw exception string.
- [ ] Tests written and passing: Widget test for each failure type.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
