# 129 — Route guards

**Phase** 06 · Application shell  |  **Depends on** [127](127-router-setup.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Send the user somewhere sensible when a route needs a project and none is selected.

## Files

- `frontend/lib/app/route_guards.dart` (new)

## Steps

1. Redirect project-scoped routes to the project picker; preserve the intended destination.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Opening a capture link with no project selected asks which project, then continues.
- [ ] Tests written and passing: Unit tests of `route_guards.dart`.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
