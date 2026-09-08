# 050 — Responsive layout builder

**Phase** 03 · Design system  |  **Depends on** [049](049-breakpoints.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A builder that hands each size class its own layout without duplicating widgets.

## Files

- `lib/core/widgets/responsive/responsive_builder.dart` (new)

## Contract

```dart
class ResponsiveBuilder extends StatelessWidget { final WidgetBuilder compact; final WidgetBuilder? medium, expanded; }
```

## Steps

1. Provide compact, medium and expanded builders with sensible fallback to the smaller class.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Two-pane layouts become a one-line change in a screen.
- [ ] Tests written and passing: Widget test at three widths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
