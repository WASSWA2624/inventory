# 126 — Imported file validation

**Phase** 05 · File storage  |  **Depends on** [022](../01-orchestration/022-security-policy.md), [026](../02-foundation/026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Validate anything arriving from outside before it is read.

## Files

- `frontend/lib/core/files/file_validation.dart` (new)

## Steps

1. Check extension, sniff the magic bytes, enforce size limits, and reject archives that unpack outside their root.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A renamed or hostile file is refused with a clear message.
- [ ] Tests written and passing: Unit tests over crafted bad inputs.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
