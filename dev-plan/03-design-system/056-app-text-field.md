# 056 — Text field

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md), [044](044-spacing-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The single text input: label, hint, helper, error, prefix and suffix slots, clear button.

## Files

- `frontend/lib/core/widgets/fields/app_text_field.dart` (new)

## Contract

```dart
class AppTextField extends StatelessWidget { final String label; final String? hint, helper, errorText; final TextEditingController controller; final int? maxLines; final Widget? trailing; final bool clearable; }
```

## Steps

1. Support single and multi-line, character counter, and a trailing slot for the microphone or scanner.
2. Surface validation errors from the shared validation display.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/04-theming.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] All later fields reuse this rather than raw TextFormField.
- [ ] Tests written and passing: Widget tests for error display and clearing.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
