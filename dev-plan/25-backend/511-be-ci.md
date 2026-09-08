# 511 — Backend pipeline

**Phase** 25 · Optional team backend  |  **Depends on** [471](471-be-lint-format.md), [508](508-be-contract-tests.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Run the whole backend gate on every push, including integration tests against a real database.

## Files

- `.github/workflows/backend.yml` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/11-security-privacy.md`.
- Team mode is optional: with it switched off this code path is inert and contacts nothing.
- The server is a coordinator, never the store of record — merge, conflict resolution and undo stay on the device.
- Degrade to standalone behaviour when the server is unreachable; never block field work on a sign-in or a sync.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A red pipeline blocks merging.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
