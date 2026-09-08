# 112 — Test fixtures and object factories

**Phase** 04 · Local database  |  **Depends on** [017](../01-orchestration/017-testing-policy.md), [097](097-records-table.md), [094](094-template-fields-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Builders that make a valid project, template, record and photo in one line.

## Files

- `test/support/factories.dart` (new)

## Steps

1. Provide factories with sensible defaults and named overrides; seed an in-memory database in one call.

## Constraints

- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Later tests are short and do not repeat setup.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
