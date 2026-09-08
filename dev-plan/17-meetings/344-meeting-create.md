# 344 — Create a meeting

**Phase** 17 · Meeting mode  |  **Depends on** [343](343-meeting-template.md), [078](../03-design-system/078-app-form-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Start a meeting record with the header filled automatically.

## Files

- `lib/features/meetings/presentation/meeting_create_screen.dart` (new)

## Steps

1. Prefill date, start time, location and secretary from context and profile.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A meeting can be started in one tap.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
