# 298 — Record domain model and repository

**Phase** 14 · Records  |  **Depends on** [097](../04-data-layer/097-records-table.md), [098](../04-data-layer/098-record-fields-table.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Models and repository for records and their field values.

## Files

- `lib/features/records/domain/record_entry.dart` (new)
- `lib/features/records/data/record_repository_impl.dart` (new)

## Steps

1. Expose a record with its values, photos, status flags and context snapshot in one read.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Round-trip mapper test.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
