# 019 — Accessibility test matchers

**Phase** 01 · Project setup and guardrails  |  **Depends on** [004](004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the reusable matchers every later widget test uses to assert semantics, labels and tap targets.

## Files

- `frontend/test/support/a11y_matchers.dart` (new)

## Contract

```dart
Matcher hasSemanticLabel(String label);  Matcher meetsTapTarget({double min = 48});  Future<void> expectNoA11yIssues(WidgetTester t)
```

## Steps

1. Implement matchers for semantic label presence, minimum tap target size and text-scale survival at 200 percent.
2. Implement a helper that runs the framework accessibility guidelines over the pumped widget.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/13-workflow.md`.
- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A button without a semantic label fails the matcher with a readable message.
- [ ] Tests written and passing: `frontend/test/support/a11y_matchers_test.dart` proves each matcher passes and fails correctly.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
