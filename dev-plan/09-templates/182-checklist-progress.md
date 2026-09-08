# 182 — Predefined row checklist view

**Phase** 09 · Templates  |  **Depends on** [180](180-predefined-rows-import.md), [067](../03-design-system/067-app-status-pill.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Show found and not-found progress while capturing.

## Files

- `lib/features/templates/presentation/checklist_screen.dart` (new)

## Steps

1. Group by context; show "Found 12 of 40"; tapping a row starts a capture for it.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The operator can see what is still missing in the current room.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
