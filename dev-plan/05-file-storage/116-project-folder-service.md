# 116 — Project folder service

**Phase** 05 · File storage  |  **Depends on** [115](115-storage-root.md), [092](../04-data-layer/092-projects-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Create and resolve the per-project folder tree.

## Files

- `lib/core/files/project_folders.dart` (new)

## Steps

1. Create photos/, documents/, audio/, meetings/, reference/, templates/, exports/, imports/ on project creation.
2. Derive a stable folder name from the project name plus a short id suffix.

## Constraints

- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Renaming a project never moves or breaks existing files.
- [ ] Tests written and passing: Unit test of tree creation and idempotency.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
