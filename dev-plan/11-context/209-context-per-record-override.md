# 209 — Per-record override

**Phase** 11 · Context  |  **Depends on** [208](208-context-apply-to-record.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Editing a context value on one record changes that record only.

## Files

- `frontend/lib/features/context/domain/context_override.dart` (new)

## Steps

1. Mark the field as overridden and leave the project context untouched.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Correcting one record's department does not move the operator's context.
- [ ] Tests written and passing: Test that the project context is unchanged after an override.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
