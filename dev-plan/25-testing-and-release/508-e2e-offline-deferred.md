# 508 — End-to-end: offline and deferred

**Phase** 25 · Testing and release  |  **Depends on** [507](507-e2e-capture-to-export.md), [254](../12-capture/254-save-raw.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Capture forty records with the network off, process later, export.

## Files

- `frontend/integration_test/offline_deferred_test.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/12-testing.md`, `frontend/.rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The test asserts zero outbound calls during capture.
- [ ] Tests written and passing: `offline_deferred_test.dart` runs green offline against fakes, end to end.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
