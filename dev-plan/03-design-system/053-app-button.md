# 053 — Buttons

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md), [044](044-spacing-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One button widget with primary, secondary, text and destructive variants, plus loading and disabled states.

## Files

- `lib/core/widgets/app_button.dart` (new)

## Contract

```dart
enum AppButtonVariant { primary, secondary, text, destructive }
class AppButton extends StatelessWidget { final String label; final VoidCallback? onPressed; final AppButtonVariant variant; final bool busy; final IconData? icon; }
```

## Steps

1. Implement variants from tokens; enforce the minimum touch target; show an inline spinner while busy.
2. Block double submission while the busy state is active.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No feature builds an ElevatedButton directly.
- [ ] Tests written and passing: Golden tests per variant and state; widget test that a busy button ignores taps.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
