# 127 — Router setup

**Phase** 06 · Application shell  |  **Depends on** [023](../02-foundation/023-app-bootstrap.md), [004](../01-orchestration/004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Install GoRouter with typed routes and a single place where every path is declared.

## Files

- `frontend/lib/app/router.dart` (new)

## Steps

1. Declare the route table from the specification; add a not-found route rendering the error state.
2. Expose typed navigation helpers so no screen builds a path string by hand.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Deep linking to a record opens it directly.
- [ ] Tests written and passing: Unit test that every declared route resolves.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
