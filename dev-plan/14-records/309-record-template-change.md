# 309 — Change a record's template

**Phase** 14 · Records  |  **Depends on** [306](306-record-detail.md), [173](../09-templates/173-template-versioning.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Move a record to a different template, re-mapping by field key.

## Files

- `frontend/lib/features/records/presentation/record_template_change.dart` (new)

## Steps

1. Show what maps, what does not, and what will be retired, before applying.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Unmapped values are retained as retired, never dropped.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
