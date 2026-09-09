# 444 — Empty-state coverage test

**Phase** 23 · Hardening  |  **Depends on** [068](../03-design-system/068-app-empty-state.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the test that fails when a list or detail screen has no empty state, then fix every screen it catches.

## Files

- `frontend/test/states/empty_state_coverage_test.dart` (new)

## Contract

```dart
Future<void> expectEmptyState(WidgetTester t, {required String action});
```

## Steps

1. Enumerate every screen that renders a collection, pump each against an empty repository, and assert the shared empty state with a primary action is shown.
2. Replace any bespoke "nothing here" text found with the shared empty state widget.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A new collection screen without an empty state fails the suite.
- [ ] Tests written and passing: The coverage test itself, one case per collection screen.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
