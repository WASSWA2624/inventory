# 124 — Storage headroom guard

**Phase** 05 · File storage  |  **Depends on** [115](115-storage-root.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Warn before the device fills and stop capture before data is lost.

## Files

- `frontend/lib/core/files/storage_guard.dart` (new)

## Steps

1. Warn below 500 MB, block new capture below 100 MB with an explanation and a link to export.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A full device produces a clear message, never a corrupt record.
- [ ] Tests written and passing: Unit test with a fake free-space source.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
