# 060 — Multi-choice field

**Phase** 03 · Design system  |  **Depends on** [059](059-app-choice-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Multiple selection with chips showing the current values.

## Files

- `lib/core/widgets/fields/app_multi_choice_field.dart` (new)

## Contract

```dart
class AppMultiChoiceField<T> extends StatelessWidget { final String label; final List<Choice<T>> options; final Set<T> value; final ValueChanged<Set<T>> onChanged; }
```

## Steps

1. Selection sheet with search, select-all and clear.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Selected values are visible without opening the sheet.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
