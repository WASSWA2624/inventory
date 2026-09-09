# 079 — Keyboard dismissal and focus traversal

**Phase** 03 · Design system  |  **Depends on** [078](078-app-form-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Dismiss on scroll, next-field traversal, and keeping the focused field visible.

## Files

- `frontend/lib/core/widgets/forms/focus_actions.dart` (new)
- `frontend/lib/core/widgets/forms/keep_focused_visible.dart` (new)

## Contract

```dart
extension FocusActions on BuildContext { void dismissKeyboard(); void focusNext(); }
class KeepFocusedVisible extends StatelessWidget { final Widget child; }
```

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Long forms remain usable on a small phone with the keyboard open.
- [ ] Tests written and passing: Golden tests of `focus_actions.dart` in light, dark and outdoor, and a widget test of every state it renders.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
