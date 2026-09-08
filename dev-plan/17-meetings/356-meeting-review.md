# 356 — Meeting review and approval

**Phase** 17 · Meeting mode  |  **Depends on** [352](352-minutes-refinement.md), [340](../16-review/340-approve-record.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Review the meeting like any other record before it is exported.

## Files

- `lib/features/meetings/presentation/meeting_review_screen.dart` (new)

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A meeting cannot be exported while its actions have no owners, when the template requires them.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
