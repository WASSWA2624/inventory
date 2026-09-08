# 096 — Context definition and state tables

**Phase** 04 · Local database  |  **Depends on** [092](092-projects-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Store the context hierarchy of a project and the values currently pinned.

## Files

- `lib/core/db/tables/context.dart` (new)

## Steps

1. Definitions: level, fieldKey, label. State: projectId, level, value, setAt.
2. Add a presets table: name, projectId, values JSON.

## Constraints

- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: DAO test that setting a higher level clears lower levels.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
