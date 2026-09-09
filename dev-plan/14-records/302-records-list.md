# 302 — Records list screen

**Phase** 14 · Records  |  **Depends on** [300](300-record-model.md), [071](../03-design-system/071-async-value-view.md), [065](../03-design-system/065-app-list-tile.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The paged list with number, name, identifier, context and status.

## Files

- `frontend/lib/features/records/presentation/records_list_screen.dart` (new)

## Steps

1. Virtualised paging; two-pane list and detail on expanded layouts.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Ten thousand records scroll smoothly.
- [ ] Tests written and passing: Widget test of paging and empty state.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
