# 499 — App: role-aware affordances

**Phase** 24 · The minimal backend  |  **Depends on** [498](498-fe-signin-enrol.md), [475](475-be-permissions.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Hide or disable what the signed-in role cannot do, while keeping the server as the real boundary.

## Files

- `frontend/lib/features/account/domain/role_gate.dart` (new)

## Steps

1. Mirror the server's role matrix (§71.3) once, as data, and read every affordance from it.
2. Take the current grant from an injected source rather than fetching it, so 500 can supply a cached one.
3. Hide what a role cannot do; never disable a control whose absence would puzzle a user without explanation.
4. Never gate capture, review, editing or export behind a role check that needs the network.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/11-security-privacy.md`.
- The backend owns users, authentication, roles, AI functionality and provider keys — and nothing else (§70.1). Relay is the one optional capability layered on top of it (§72).
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device (§70.2).
- Fall back to the cached session and the last cached role grant when the server is unreachable; never block capture, review, editing or export on a sign-in or a relay (§70.4).
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The interface never offers an action the server will refuse.
- [ ] The role matrix exists in exactly one place, and a test compares it against the server's.
- [ ] Tests written and passing: Tests per role over the capability list.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Caching grants and surviving expiry — that is 500.
- Anything not named above. Raise it as its own task rather than widening this one.
