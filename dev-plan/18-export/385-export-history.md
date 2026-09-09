# 385 — Export history

**Phase** 18 · Export  |  **Depends on** [108](../04-data-layer/108-exports-table.md), [382](382-export-manifest.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record every export and allow re-share without regenerating.

## Files

- `frontend/lib/features/exports/presentation/export_history_screen.dart` (new)

## Steps

1. Store timestamp, operator, formats, filters, count, path and file hash; stamp records with exportedAt.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A user can explain, months later, exactly what a given file contained.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
