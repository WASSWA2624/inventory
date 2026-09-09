# 207 — Cascade clearing

**Phase** 11 · Context  |  **Depends on** [206](206-context-level-picker.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Changing a higher level clears the levels below it, after one confirmation.

## Files

- `frontend/lib/features/context/domain/context_cascade.dart` (new)

## Steps

1. Show the one-line confirmation from the specification naming exactly what will clear.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Changing district never leaves a stale facility attached to new records.
- [ ] Tests written and passing: Unit test of the cascade rules.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
