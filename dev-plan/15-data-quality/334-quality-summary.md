# 334 — Project quality summary

**Phase** 15 · Data quality  |  **Depends on** [326](326-duplicates-screen.md), [332](332-variance-screen.md), [315](315-validation-engine.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One screen answering what still blocks a clean export.

## Files

- `frontend/lib/features/quality/presentation/quality_summary_screen.dart` (new)

## Steps

1. Counts of invalid records, unresolved duplicates, unresolved conflicts and unreviewed records, each tappable.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A user can reach export-ready state by clearing this list.
- [ ] Tests written and passing: Widget test of `quality_summary_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
