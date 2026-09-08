# 098 — Record fields table

**Phase** 04 · Local database  |  **Depends on** [097](097-records-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One row per field per record, carrying raw, refined, final and provenance.

## Files

- `lib/core/db/tables/record_fields.dart` (new)

## Steps

1. Columns: recordId, fieldKey, valueRaw, valueRefined, valueFinal, confidence, source, verified, verifiedBy, verifiedAt plus the change-tracking columns.
2. Unique index on recordId plus fieldKey; index on fieldKey plus valueFinal for search.

## Constraints

- Every table carries `id`, `createdAt`, `updatedAt`, `updatedByDevice` and `rev` through the shared column mixins.
- Deletes write a tombstone in the same transaction; nothing is hard-deleted.
- Raw columns are written once at creation and never updated.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Raw and refined are separate columns from the first migration, never one column.
- [ ] Tests written and passing: DAO test that writing refined leaves raw untouched.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
