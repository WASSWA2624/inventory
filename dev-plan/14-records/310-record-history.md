# 310 — Record history view

**Phase** 14 · Records  |  **Depends on** [090](../04-data-layer/090-audit-table.md), [306](306-record-detail.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The chronological story of one record, as in the specification.

## Files

- `frontend/lib/features/records/presentation/record_history_screen.dart` (new)

## Steps

1. Show captures, processing, edits with previous and new values, approvals, merges and exports.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A reviewer can reconstruct every change without a server.
- [ ] Tests written and passing: Widget test of `record_history_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
