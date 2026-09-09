# 502 — App: relay controls and visibility

**Phase** 24 · The minimal backend  |  **Depends on** [501](501-fe-relay-client.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Give the user the switches and the visibility the relay rules require.

## Files

- `frontend/lib/features/account/presentation/relay_settings_screen.dart` (new)

## Steps

1. Per-project enable, schedule, Wi-Fi only, and a never-relay marking; show queued, sent and purged packages.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- The backend owns users, authentication, roles, AI functionality and provider keys — and nothing else (§70.1). Relay is the one optional capability layered on top of it (§72).
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device (§70.2).
- Fall back to the cached session and the last cached role grant when the server is unreachable; never block capture, review, editing or export on a sign-in or a relay (§70.4).
- Relay is the backend's one **optional** capability (§72): an organisation that never enables it must still have a complete, fully working product.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Relay is off until a project manager turns it on, and what has been sent is always visible.
- [ ] Tests written and passing: Widget tests for each control and the queue view.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
