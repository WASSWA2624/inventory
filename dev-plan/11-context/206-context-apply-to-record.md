# 206 — Apply context to a new record

**Phase** 11 · Context fields  |  **Depends on** [202](202-context-persistence.md), [098](../04-data-layer/098-record-fields-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Prefill context fields on record creation and snapshot them onto the record.

## Files

- `frontend/lib/features/context/domain/context_application.dart` (new)

## Steps

1. Write values with source CONTEXT and store the whole context as the record snapshot.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Ten records captured in one room all carry the same three values without typing.
- [ ] Tests written and passing: Test asserting values and source on a new record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
