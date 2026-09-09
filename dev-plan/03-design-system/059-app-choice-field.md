# 059 — Single choice field

**Phase** 03 · Design system  |  **Depends on** [056](056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Dropdown or segmented control chosen by option count.

## Files

- `frontend/lib/core/widgets/fields/app_choice_field.dart` (new)

## Contract

```dart
class AppChoiceField<T> extends StatelessWidget { final String label; final List<Choice<T>> options; final T? value; final ValueChanged<T?> onChanged; }
```

## Steps

1. Under four options render segmented; otherwise a searchable sheet.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Long option lists remain usable on a small screen.
- [ ] Tests written and passing: Golden tests of `app_choice_field.dart` in light, dark and outdoor, and a widget test of every state it renders.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
