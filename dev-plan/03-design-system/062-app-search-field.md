# 062 — Search field

**Phase** 03 · Design system  |  **Depends on** [056](056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Debounced search input with clear and result count slot.

## Files

- `lib/core/widgets/app_search_field.dart` (new)

## Contract

```dart
class AppSearchField extends StatelessWidget { final String hint; final ValueChanged<String> onChanged; final VoidCallback? onSubmitted; final Duration debounce; final int? resultCount; }
```

## Steps

1. Debounce at the constant from app constants; expose submitted and changed callbacks.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Records, datasets and template pickers all use it.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
