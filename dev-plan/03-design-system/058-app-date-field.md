# 058 — Date, time and date-time field

**Phase** 03 · Design system  |  **Depends on** [056](056-app-text-field.md), [030](../02-foundation/030-clock-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One control for all three temporal types, defaulting to now.

## Files

- `lib/core/widgets/fields/app_date_field.dart` (new)

## Contract

```dart
enum DateFieldMode { date, time, dateTime }
class AppDateField extends StatelessWidget { final String label; final DateFieldMode mode; final DateTime? value; final bool autoFilled; final ValueChanged<DateTime?> onChanged; }
```

## Steps

1. Show the formatted value with a picker; support clearing; mark auto-filled values with the auto affordance.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Auto-filled dates are visibly distinct from typed ones.
- [ ] Tests written and passing: Widget test with a frozen clock.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
