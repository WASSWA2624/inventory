# 507 — End-to-end: capture to export

**Phase** 25 · Testing and release  |  **Depends on** [506](506-test-harness-integration.md), [253](../12-capture/253-save-immediate.md), [383](../18-export/383-export-screen.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The core path: create project, pick template, set context, capture, process, review, approve, export.

## Files

- `frontend/integration_test/capture_to_export_test.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/12-testing.md`, `frontend/.rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The vertical slice is protected by a test that fails loudly if it breaks.
- [ ] Tests written and passing: `capture_to_export_test.dart` runs green offline against fakes, end to end.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
