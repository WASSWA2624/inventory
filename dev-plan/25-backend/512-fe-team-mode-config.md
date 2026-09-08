# 512 — App: team mode configuration

**Phase** 25 · Optional team backend  |  **Depends on** [487](487-be-auth-tokens.md), [135](../07-operator-and-settings/135-settings-shell.md), [037](../02-foundation/037-secure-storage-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Add the client side of team mode: server address, enrolment state and a switch that is off by default.

## Files

- `frontend/lib/features/team/data/team_config.dart` (new)
- `frontend/lib/features/team/presentation/team_settings_screen.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- Team mode is optional: with it switched off this code path is inert and contacts nothing.
- The server is a coordinator, never the store of record — merge, conflict resolution and undo stay on the device.
- Degrade to standalone behaviour when the server is unreachable; never block field work on a sign-in or a sync.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] With team mode off, the app behaves exactly as it does today and contacts nothing.
- [ ] Tests written and passing: Test asserting no outbound call while team mode is disabled.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
