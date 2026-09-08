# 211 — Optional auto-clear timer

**Phase** 11 · Context fields  |  **Depends on** [202](202-context-persistence.md), [136](../07-operator-and-settings/136-settings-store.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Optionally clear the lowest level after a period of inactivity.

## Files

- `lib/features/context/domain/context_auto_clear.dart` (new)

## Steps

1. Off by default; configurable interval; a single undo toast when it fires.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] With the setting off, context never changes on its own.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
