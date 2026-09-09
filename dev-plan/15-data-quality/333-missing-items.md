# 333 — Missing and not-found reporting

**Phase** 15 · Data quality  |  **Depends on** [331](331-variance-computation.md), [184](../09-templates/184-checklist-progress.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Identify register entries never found and checklist rows never captured.

## Files

- `frontend/lib/features/quality/domain/missing_items.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Missing items are exportable as their own set.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
