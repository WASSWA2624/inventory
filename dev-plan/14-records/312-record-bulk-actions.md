# 312 — Bulk actions on records

**Phase** 14 · Records  |  **Depends on** [300](300-records-list.md), [233](../12-capture/233-photo-multi-select.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Select several records and approve, archive, delete, export or re-process them together.

## Files

- `lib/features/records/presentation/record_bulk_actions.dart` (new)

## Steps

1. Show the count in the action bar; confirm destructive bulk actions with the count named.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A bulk action reports how many succeeded and how many failed.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
