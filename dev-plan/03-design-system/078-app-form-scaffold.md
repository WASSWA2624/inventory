# 078 — Form scaffold and validation display

**Phase** 03 · Design system  |  **Depends on** [056](056-app-text-field.md), [053](053-app-button.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Consistent form layout, error summary and save behaviour.

## Files

- `lib/core/widgets/forms/app_form.dart` (new)

## Contract

```dart
class AppForm extends StatefulWidget { final List<Widget> fields; final String submitLabel; final Future<void> Function() onSubmit; final bool guardUnsaved; }
```

## Steps

1. Provide field spacing, a submit bar, an error summary at the top and unsaved-changes guarding.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Leaving a dirty form always prompts, on every screen.
- [ ] Tests written and passing: Widget test of the unsaved-changes guard.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
