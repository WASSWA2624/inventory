# 384 — Export versioning and folders

**Phase** 18 · Export  |  **Depends on** [383](383-export-history.md), [116](../05-file-storage/116-project-folder-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Versioned, dated folders that are never overwritten.

## Files

- `frontend/lib/features/exports/domain/export_versioning.dart` (new)

## Steps

1. Allocate v1, v2 and so on per project, in dated directories.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A new export never destroys a previous one.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
