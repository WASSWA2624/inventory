# 505 — Widget test harness

**Phase** 25 · Testing and release  |  **Depends on** [504](504-test-harness-unit.md), [046](../03-design-system/046-theme-assembly.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A pump helper that installs theme, providers, router and a fixed clock.

## Files

- `frontend/test/support/pump_app.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/12-testing.md`, `frontend/rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every widget test starts from one line of setup.
- [ ] Tests written and passing: A smoke test proving the harness itself works, and one suite consuming it.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
