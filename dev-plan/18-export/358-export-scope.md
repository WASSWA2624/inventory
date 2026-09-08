# 358 — Export scope selection

**Phase** 18 · Export  |  **Depends on** [357](357-export-model.md), [302](../14-records/302-records-filters.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Choose which records go into the export.

## Files

- `lib/features/exports/presentation/export_scope_section.dart` (new)

## Steps

1. Options: approved only, all, current context, date range, current filter.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The chosen scope shows a live record count before export starts.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
