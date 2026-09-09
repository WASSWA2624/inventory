# 506 — Integration test harness

**Phase** 25 · Testing and release  |  **Depends on** [505](505-test-harness-widget.md), [084](../04-data-layer/084-drift-setup.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Drive the real app against an in-memory database and fake services.

## Files

- `frontend/integration_test/support/` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/12-testing.md`, `frontend/rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Integration tests run with no network and no real provider.
- [ ] Tests written and passing: A smoke test proving the harness itself works, and one integration suite
      consuming it offline against fakes.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
