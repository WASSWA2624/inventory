# 125 — Orphan file scanner

**Phase** 05 · File storage  |  **Depends on** [113](../04-data-layer/113-db-integrity-check.md), [116](116-project-folder-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Find files with no database row and rows with no file.

## Files

- `frontend/lib/core/files/orphan_scanner.dart` (new)

## Steps

1. Report both directions with sizes; offer adoption for orphan files and evidence-missing flags for missing files.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Nothing is deleted without explicit user choice.
- [ ] Tests written and passing: Test with a deliberately orphaned file and row.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
