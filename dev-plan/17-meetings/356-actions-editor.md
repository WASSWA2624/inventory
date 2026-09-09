# 356 — Action items editor

**Phase** 17 · Meetings  |  **Depends on** [354](354-minutes-refinement.md), [058](../03-design-system/058-app-date-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Manage actions with owner, due date and status.

## Files

- `frontend/lib/features/meetings/presentation/actions_editor.dart` (new)

## Steps

1. Owner can be picked from attendees or the staff dataset.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Actions are exportable as their own register.
- [ ] Tests written and passing: Widget test of `actions_editor.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
