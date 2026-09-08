# 456 — End-to-end: capture to export

**Phase** 24 · Testing and release  |  **Depends on** [455](455-test-harness-integration.md), [251](../12-capture/251-save-immediate.md), [381](../18-export/381-export-screen.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The core path: create project, pick template, set context, capture, process, review, approve, export.

## Files

- `integration_test/capture_to_export_test.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The vertical slice is protected by a test that fails loudly if it breaks.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
