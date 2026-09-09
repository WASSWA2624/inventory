# 057 — Number field

**Phase** 03 · Design system  |  **Depends on** [056](056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Numeric entry with unit suffix, decimal control and range hints.

## Files

- `frontend/lib/core/widgets/fields/app_number_field.dart` (new)

## Contract

```dart
class AppNumberField extends StatelessWidget { final String label; final String? unit; final num? min, max; final bool decimal; final ValueChanged<num?> onChanged; }
```

## Steps

1. Use the numeric keyboard, reject invalid characters, and display the field unit from the template.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Typing letters is impossible; out-of-range values show the shared error style.
- [ ] Tests written and passing: Golden tests of `app_number_field.dart` in light, dark and outdoor, and a widget test of every state it renders.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
