# 212 — Optional movement prompt

**Phase** 11 · Context fields  |  **Depends on** [211](211-context-auto-clear.md), [036](../02-foundation/036-permissions-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Ask the operator to confirm the context after moving a configured distance.

## Files

- `lib/features/context/domain/context_movement_prompt.dart` (new)

## Steps

1. Off by default and only active when GPS is already enabled.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No location is read when the feature is off.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
