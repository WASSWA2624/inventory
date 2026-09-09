# 496 — Backend pipeline

**Phase** 24 · The minimal backend  |  **Depends on** [456](456-be-lint-format.md), [493](493-be-contract-tests.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Run the whole backend gate on every push, including integration tests against a real database.

## Files

- `.github/workflows/backend.yml` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- The backend owns users, authentication, roles, AI functionality and provider keys — and nothing else (§70.1). Relay is the one optional capability layered on top of it (§72).
- The server governs people, permissions and keys; it is never the store of record — project content, merge, conflict resolution and undo stay on the device (§70.2).
- Fall back to the cached session and the last cached role grant when the server is unreachable; never block capture, review, editing or export on a sign-in or a relay (§70.4).
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A red pipeline blocks merging.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
