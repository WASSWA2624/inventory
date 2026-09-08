# 453 — Unit test harness

**Phase** 24 · Testing and release  |  **Depends on** [017](../01-orchestration/017-testing-policy.md), [112](../04-data-layer/112-test-fixtures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Shared setup, fakes and matchers for domain tests.

## Files

- `test/support/` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A new unit test needs no boilerplate beyond its assertions.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
