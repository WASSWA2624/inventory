# 210 — Pinned non-hierarchical fields

**Phase** 11 · Context  |  **Depends on** [205](205-context-bar.md), [164](../09-templates/164-field-advanced-attributes.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Pin any stickable field, such as surveyor or funder, without it being a level.

## Files

- `frontend/lib/features/context/presentation/pinned_fields_sheet.dart` (new)

## Steps

1. Show pinned fields as chips beside the hierarchy; same prefill behaviour.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A survey date can be pinned once and applied to every record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
