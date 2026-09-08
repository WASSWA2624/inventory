# 147 — Project home screen

**Phase** 08 · Projects  |  **Depends on** [146](146-project-open.md), [064](../03-design-system/064-app-card.md), [131](../06-app-shell/131-status-line.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The screen that answers "what should I do next" with one dominant action.

## Files

- `lib/features/projects/presentation/project_home_screen.dart` (new)

## Steps

1. Show counts, the current context, and Continue capturing as the primary action.
2. Secondary row: Review, Process, Export, Share, each with its pending count.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every number on the screen is tappable and leads to the matching list.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
