# 141 — Manual offline mode switch

**Phase** 07 · Operator profile and settings  |  **Depends on** [035](../02-foundation/035-connectivity-service.md), [136](136-settings-store.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One switch that blocks every outbound call.

## Files

- `frontend/lib/features/settings/presentation/offline_switch.dart` (new)

## Steps

1. When on, queue anything that would have gone online and say so in the status line.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] With the switch on, no network call is made anywhere in the app.
- [ ] Tests written and passing: Integration test asserting zero outbound calls.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
