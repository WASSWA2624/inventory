# 515 — App: change relay client

**Phase** 25 · Optional team backend  |  **Depends on** [513](513-fe-team-signin.md), [387](../19-bundles-and-merge/387-bundle-writer.md), [405](../19-bundles-and-merge/405-merge-apply.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Push and pull encrypted change packages, reusing the bundle and merge machinery unchanged.

## Files

- `frontend/lib/core/team/relay_client.dart` (new)

## Steps

1. Build a delta bundle since the last acknowledged version, encrypt with the project key, push with an idempotency key.
2. Pull others packages, decrypt, and hand them to the existing merge preview and conflict flow.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- Team mode is optional: with it switched off this code path is inert and contacts nothing.
- The server is a coordinator, never the store of record — merge, conflict resolution and undo stay on the device.
- Degrade to standalone behaviour when the server is unreachable; never block field work on a sign-in or a sync.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Relayed packages merge through exactly the same preview and conflict path as a hand-carried bundle.
- [ ] Tests written and passing: Integration test relaying between two local databases through a fake server.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
