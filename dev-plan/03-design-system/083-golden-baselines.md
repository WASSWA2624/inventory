# 083 — Golden test baselines for the catalogue

**Phase** 03 · Design system  |  **Depends on** [082](082-widget-gallery.md), [017](../01-orchestration/017-testing-policy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Lock the appearance of the design system so drift is caught by tests.

## Files

- `test/design_system/goldens/` (new)

## Contract

```dart
Future<void> expectGolden(WidgetTester t, Widget w, String name, {List<AppThemeMode> modes});
```

## Steps

1. Generate goldens for every catalogue widget in light, dark and outdoor themes.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A styling change that was not intended fails the test suite.
- [ ] Tests written and passing: Golden suite runs in continuous integration.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
