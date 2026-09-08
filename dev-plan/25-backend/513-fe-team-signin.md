# 513 — App: sign in and enrol

**Phase** 25 · Optional team backend  |  **Depends on** [512](512-fe-team-mode-config.md), [078](../03-design-system/078-app-form-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Implement sign-in, device enrolment and cached credentials so no one meets a login screen in the field.

## Files

- `frontend/lib/core/team/team_api_client.dart` (new)
- `frontend/lib/features/team/presentation/sign_in_screen.dart` (new)

## Steps

1. Put every authentication and enrolment call in the core client; the screen calls the client and never a server.
2. Cache the session for the configured period; refresh silently; degrade to standalone behaviour when unreachable.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- Team mode is optional: with it switched off this code path is inert and contacts nothing.
- The server is a coordinator, never the store of record — merge, conflict resolution and undo stay on the device.
- Degrade to standalone behaviour when the server is unreachable; never block field work on a sign-in or a sync.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A signed-in device works for the full cached period with no connectivity.
- [ ] Tests written and passing: Tests for sign-in, refresh, expiry and offline fallback.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
