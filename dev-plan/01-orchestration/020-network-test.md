# 020 — Network boundary test

**Phase** 01 · Project setup and guardrails  |  **Depends on** [004](004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the test that keeps networking confined to the two places allowed to do it.

## Files

- `frontend/test/architecture/network_test.dart` (new)

## Steps

1. Fail on any import of a HTTP client outside `frontend/lib/core/ai/`, `frontend/lib/core/cloud/` and `frontend/lib/core/team/`.
2. Fail when a widget or domain file references a network client type.
3. Assert no capture, records or export file imports a networking package.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/13-workflow.md`.
- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Adding a HTTP call inside a feature repository fails the test.
- [ ] Tests written and passing: The test with compliant and non-compliant fixtures.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
