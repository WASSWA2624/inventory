# 202 — Persist and restore context

**Phase** 11 · Context fields  |  **Depends on** [200](200-context-model.md), [146](../08-projects/146-project-open.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Context survives screen changes, app restarts and device sleep.

## Files

- `lib/features/context/data/context_persistence.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Reopening the app resumes the same district, facility and department.
- [ ] Tests written and passing: Test that state reloads after a simulated restart.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
