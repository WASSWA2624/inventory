# 204 — Context level picker

**Phase** 11 · Context fields  |  **Depends on** [203](203-context-bar.md), [073](../03-design-system/073-app-bottom-sheet.md), [194](../10-reference-data/194-lookup-exact-match.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Choose a value for one level from recents, a reference dataset, or free text.

## Files

- `lib/features/context/presentation/context_picker_sheet.dart` (new)

## Steps

1. Show recent values first; offer dataset search when the level is bound to one; allow new values.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Setting a facility takes two taps on the second visit.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
