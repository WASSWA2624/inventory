# 500 — App: offline authority and cached grants

**Phase** 24 · The minimal backend  |  **Depends on** [498](498-fe-signin-enrol.md), [499](499-fe-role-affordances.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The one service that answers "what may this device do right now", so that a required backend never becomes a
required *connection*. Specification §70.4 is the contract: a device that has signed in once behaves, with the
server unreachable, exactly as if no server existed.

## Files

- `frontend/lib/core/backend/offline_authority.dart` (new)
- `frontend/lib/core/backend/grant_cache.dart` (new)

## Contract

```dart
enum AuthorityState { fresh, cachedValid, cachedExpired, neverSignedIn }

abstract class OfflineAuthority {
  AuthorityState get state;
  DateTime? get grantsExpireAt;
  bool may(Capability capability);   // capture, review, export, relay, aiProxy, adminAction
}
```

## Steps

1. Cache the session and the role grant separately, each with its own configurable lifetime (default 30 days), and
   persist both so they survive a restart.
2. Answer `may()` from the cache, never from the network. Capture, review, editing, validation, export and manual
   bundle exchange are permitted in every state except `neverSignedIn`.
3. Past expiry, keep full read, capture, review, edit and export access to the projects the device already holds, and
   withhold only the three things that genuinely need the server: relay, the AI proxy, and changed role grants.
4. Refresh both caches opportunistically whenever the server is reachable; never on a schedule that interrupts work.
5. Surface the state in the status line (§56 rule 13) as a quiet indicator, not a dialog, and give **More** a single
   line saying when the grant expires.

## Reuse

- The connectivity signal, the secure store and the settings store already exist; this task adds none of them.
- Role definitions come from 499, not from a second copy of the role matrix.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/11-security-privacy.md`.
- The backend is required, but never in the way: being unable to reach it must never cost a user a record.
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A device 45 days offline, past both cache lifetimes, still captures, reviews, edits and exports its projects.
- [ ] That same device refuses only relay, the AI proxy and a role change, and says which, in plain language.
- [ ] No code path anywhere in the app blocks capture on an authority check.
- [ ] Tests written and passing: unit tests over all four authority states and every capability; a test that clock advance past expiry never disables capture or export.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Sign-in and enrolment mechanics — that is 498.
- Hiding controls a role cannot use — that is 499.
- Anything not named above. Raise it as its own task rather than widening this one.
