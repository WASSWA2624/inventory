# 143 — Project domain model and repository

**Phase** 08 · Projects  |  **Depends on** [092](../04-data-layer/092-projects-table.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The domain model, mapper and repository implementation for projects.

## Files

- `frontend/lib/features/projects/domain/project.dart` (new)
- `frontend/lib/features/projects/data/project_repository_impl.dart` (new)

## Steps

1. Model status, dates, settings and folder name; map to and from the table row.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Presentation never sees a Drift row.
- [ ] Tests written and passing: Round-trip mapper test.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
