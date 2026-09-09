# 497 — App: backend connection and enrolment state

**Phase** 24 · The minimal backend  |  **Depends on** [472](472-be-auth-tokens.md), [135](../07-account-and-settings/135-settings-shell.md), [037](../02-foundation/037-secure-storage-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The client side of a backend that is always there: the organisation's server address, the enrolment state machine,
and the settings screen that shows both. There is no switch that turns the backend off — every deployment has one
(§70) — so this task replaces the idea of an optional "team mode" with a connection that is either enrolled,
enrolling, or not yet enrolled.

## Files

- `frontend/lib/core/backend/backend_config.dart` (new)
- `frontend/lib/features/account/presentation/backend_settings_screen.dart` (new)

## Contract

```dart
enum EnrolmentState { notEnrolled, enrolling, enrolled, revoked }

class BackendConfig {
  Uri get baseUrl;
  String? get organisationId;
  EnrolmentState get state;
}
```

## Steps

1. Read the server address from build configuration, and allow an administrator to set it once at first run for a
   self-hosted deployment; store it with the enrolment state, never in the database.
2. Keep tokens and the organisation identifier in secure storage (§30.2), never in settings or logs.
3. Show, in Settings: the server address, the signed-in account, the device enrolment state, and when the cached
   grant expires. Nothing on this screen is a toggle for whether the backend exists.
4. Treat unreachable as an ordinary state, not an error banner: the status line says so quietly and the app carries
   on (§70.4).

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/11-security-privacy.md`.
- The backend owns users, authentication, roles, AI functionality and provider keys — and nothing else (§70.1). Relay is the one optional capability layered on top of it (§72).
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device (§70.2).
- Fall back to the cached session and the last cached role grant when the server is unreachable; never block capture, review, editing or export on a sign-in or a relay (§70.4).
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An unreachable server changes nothing about what the app will let a user do, and says so in one quiet line.
- [ ] No token, key or organisation identifier is written anywhere but secure storage.
- [ ] Tests written and passing: unit tests over the enrolment state machine, and a test asserting no credential reaches the database, a log or an export.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Signing in and enrolling — that is 498.
- Deciding what a role may do — that is 499.
- Anything not named above. Raise it as its own task rather than widening this one.
