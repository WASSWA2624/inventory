# 511 — End-to-end: known asset verification

**Phase** 25 · Testing and release  |  **Depends on** [507](507-e2e-capture-to-export.md), [330](../15-data-quality/330-verification-prefill.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Import a register, scan an identifier, confirm, edit one value, check the variance.

## Files

- `frontend/integration_test/verification_test.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/12-testing.md`, `frontend/rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
