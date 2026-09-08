# 349 — Match attendees to staff data

**Phase** 17 · Meeting mode  |  **Depends on** [348](348-attendance-ocr.md), [195](../10-reference-data/195-lookup-fuzzy-match.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Link extracted names to the Staff reference dataset where one exists.

## Files

- `lib/features/meetings/domain/attendee_matching.dart` (new)

## Steps

1. Offer a suggestion with a score; never link automatically below the threshold.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
