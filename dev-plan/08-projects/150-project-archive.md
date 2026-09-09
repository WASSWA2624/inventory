# 150 — Archive and unarchive a project

**Phase** 08 · Projects  |  **Depends on** [148](148-project-edit.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Move a finished project out of the active list without deleting anything.

## Files

- `frontend/lib/features/projects/presentation/project_archive_action.dart` (new)

## Steps

1. Archived projects are hidden by default and excluded from default exports.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Archiving is reversible and loses nothing.
- [ ] Tests written and passing: Widget test of `project_archive_action.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
