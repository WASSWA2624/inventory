# 498 — App: sign in and enrol

**Phase** 24 · The minimal backend  |  **Depends on** [497](497-fe-backend-config.md), [078](../03-design-system/078-app-form-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Sign-in and device enrolment: the one moment the backend is genuinely required. It happens once, on first run,
and never again in the field (§71.1, §70.4).

## Files

- `frontend/lib/core/backend/backend_api_client.dart` (new)
- `frontend/lib/features/account/presentation/sign_in_screen.dart` (new)

## Steps

1. Put every authentication and enrolment call in the core client; the screen calls the client and never a server.
2. Gate first run on sign-in, and only first run. Once enrolled, the app opens straight into work for the whole
   cached period (default 30 days), refreshing silently whenever the server happens to be reachable.
3. Reconcile the local operator profile at enrolment: the account identity becomes the attribution identity, and
   records already captured under the local profile keep their attribution and gain the account id (§71.2).
4. Handle sign-out as an explicit, confirmed action that warns it will need connectivity to sign back in.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- The backend owns users, authentication, roles, AI functionality and provider keys — and nothing else (§70.1). Relay is the one optional capability layered on top of it (§72).
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device (§70.2).
- Fall back to the cached session and the last cached role grant when the server is unreachable; never block capture, review, editing or export on a sign-in or a relay (§70.4).
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A signed-in device works for the full cached period with no connectivity, and never shows a login screen again.
- [ ] Records captured before enrolment keep their operator attribution and gain the account identity.
- [ ] Tests written and passing: tests for sign-in, refresh, expiry, offline fallback and operator-profile reconciliation.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- The cached-authority contract and what a device may do past expiry — that is 500.
- Anything not named above. Raise it as its own task rather than widening this one.
