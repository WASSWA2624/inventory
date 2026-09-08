# 516 — App: relay controls and visibility

**Phase** 25 · Optional team backend  |  **Depends on** [515](515-fe-relay-client.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Give the user the switches and the visibility the relay rules require.

## Files

- `frontend/lib/features/team/presentation/relay_settings_screen.dart` (new)

## Steps

1. Per-project enable, schedule, Wi-Fi only, and a never-relay marking; show queued, sent and purged packages.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- Team mode is optional: with it switched off this code path is inert and contacts nothing.
- The server is a coordinator, never the store of record — merge, conflict resolution and undo stay on the device.
- Degrade to standalone behaviour when the server is unreachable; never block field work on a sign-in or a sync.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Relay is off until a project manager turns it on, and what has been sent is always visible.
- [ ] Tests written and passing: Widget tests for each control and the queue view.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
