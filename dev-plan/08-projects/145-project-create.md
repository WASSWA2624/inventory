# 145 — Create a project

**Phase** 08 · Projects  |  **Depends on** [143](143-project-model.md), [078](../03-design-system/078-app-form-scaffold.md), [116](../05-file-storage/116-project-folder-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A short form that creates the row and the folder tree in one transaction.

## Files

- `frontend/lib/features/projects/presentation/project_create_screen.dart` (new)

## Steps

1. Fields: name, optional description and organisation; everything else defaulted.
2. Create the folder tree and the default context definition in the same transaction.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A project exists and is ready for capture after one screen.
- [ ] Tests written and passing: Test that a failed folder creation rolls back the row.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
