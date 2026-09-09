# 117 — Path and name sanitiser

**Phase** 05 · File storage  |  **Depends on** [115](115-storage-root.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn arbitrary user text into safe folder and file names.

## Files

- `frontend/lib/core/files/path_sanitizer.dart` (new)

## Steps

1. Uppercase where required, strip accents, replace spaces with hyphens, remove reserved characters, cap length, resolve collisions with a numeric suffix.
2. Reject traversal sequences outright.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A facility named with slashes or emoji still produces a valid folder.
- [ ] Tests written and passing: Unit tests over a table of hostile inputs.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
