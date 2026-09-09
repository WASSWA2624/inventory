# 205 — Context bar widget

**Phase** 11 · Context  |  **Depends on** [204](204-context-persistence.md), [063](../03-design-system/063-app-chip.md), [131](../06-app-shell/131-status-line.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The always-visible breadcrumb of pinned values.

## Files

- `frontend/lib/features/context/presentation/context_bar.dart` (new)

## Steps

1. Render levels as chips with separators; truncate gracefully on narrow screens; tap to change.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The bar fits a small phone without wrapping into three lines.
- [ ] Tests written and passing: Golden test at three widths with long facility names.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
