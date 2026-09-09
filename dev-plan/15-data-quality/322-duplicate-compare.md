# 322 — Duplicate comparison view

**Phase** 15 · Data quality  |  **Depends on** [321](321-duplicate-prompt.md), [306](../14-records/306-record-detail.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Side-by-side comparison of the two records and their photos.

## Files

- `frontend/lib/features/quality/presentation/duplicate_compare_screen.dart` (new)

## Steps

1. Highlight only the fields that differ; show photo counts and capture details for both.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/07-consistency.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A decision can be made without opening either record separately.
- [ ] Tests written and passing: Widget test of `duplicate_compare_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
