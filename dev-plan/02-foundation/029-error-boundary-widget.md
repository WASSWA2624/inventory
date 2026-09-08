# 029 — Error boundary widget

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md), [023](023-app-bootstrap.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the widget that catches build errors below it and renders a recoverable panel.

## Files

- `frontend/lib/core/widgets/error_boundary.dart` (new)

## Contract

```dart
class ErrorBoundary extends StatefulWidget { final Widget child; final VoidCallback? onRetry; }
```

## Steps

1. Override the error builder for the subtree, log the error and render a retry affordance.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A throwing child produces a recoverable panel, not a red screen.
- [ ] Tests written and passing: `frontend/test/core/widgets/error_boundary_test.dart` pumps a deliberately throwing child.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
