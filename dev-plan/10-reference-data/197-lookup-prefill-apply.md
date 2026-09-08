# 197 — Apply a lookup prefill

**Phase** 10 · Reference data and lookups  |  **Depends on** [196](196-lookup-multi-match.md), [098](../04-data-layer/098-record-fields-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Fill the mapped fields, marked as lookup-sourced and linked to the row.

## Files

- `frontend/lib/features/reference/domain/lookup_prefill.dart` (new)

## Steps

1. Write source LOOKUP with the dataset row id in provenance; never overwrite a verified value.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Filled fields show the link affordance and remain editable.
- [ ] Tests written and passing: Test that a verified field is left alone.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
