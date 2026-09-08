# 072 — Dialog service

**Phase** 03 · Design system  |  **Depends on** [053](053-app-button.md), [046](046-theme-assembly.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Alert, confirm and destructive dialogs through one API, never constructed ad hoc.

## Files

- `lib/core/widgets/feedback/app_dialog.dart` (new)

## Contract

```dart
Future<bool> showAppConfirm(BuildContext c, {required String title, required String message, required String confirmLabel, bool destructive = false});
Future<void> showAppAlert(BuildContext c, {required String title, required String message});
```

## Steps

1. Destructive variant requires an explicit action label and returns a typed result.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Delete flows across the app look and behave identically.
- [ ] Tests written and passing: Widget tests for confirm and cancel paths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
