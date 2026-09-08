# 131 — Global status line

**Phase** 06 · Application shell  |  **Depends on** [128](128-nav-shell.md), [035](../02-foundation/035-connectivity-service.md), [063](../03-design-system/063-app-chip.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One line that always says where you are and what is pending.

## Files

- `frontend/lib/app/widgets/status_line.dart` (new)

## Steps

1. Show current context summary, pinned template, online state and unprocessed count.
2. Tapping a segment navigates to the thing it describes.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The user can answer "where am I and what is queued" without leaving the screen.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
