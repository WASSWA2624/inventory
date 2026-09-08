# 055 — Large primary action button

**Phase** 03 · Design system  |  **Depends on** [053](053-app-button.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The dominant action used by capture and review, thumb-reachable and unmistakable.

## Files

- `lib/core/widgets/app_primary_action.dart` (new)

## Contract

```dart
class AppPrimaryAction extends StatelessWidget { final String label; final String? caption; final VoidCallback? onPressed; final bool busy; }
```

## Steps

1. Full-width, tall, with optional secondary caption line and busy state.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Capture and review use the identical control.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
