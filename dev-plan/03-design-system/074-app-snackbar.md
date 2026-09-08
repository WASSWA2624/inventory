# 074 — Snackbar and toast service

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Short confirmations with an optional undo action.

## Files

- `lib/core/widgets/feedback/app_snackbar.dart` (new)

## Contract

```dart
enum SnackTone { info, success, warning, error }
void showAppSnack(BuildContext c, String message, {SnackTone tone = SnackTone.info, String? undoLabel, VoidCallback? onUndo});
```

## Steps

1. Queue messages so they do not overlap; expose success, warning and error styles with an undo slot.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every destructive action can offer undo through this one call.
- [ ] Tests written and passing: Widget test that undo invokes the callback.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
