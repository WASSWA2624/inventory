# 351 — Match attendees to staff data

**Phase** 17 · Meetings  |  **Depends on** [350](350-attendance-ocr.md), [197](../10-reference-data/197-lookup-fuzzy-match.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Link extracted names to the Staff reference dataset where one exists.

## Files

- `frontend/lib/features/meetings/domain/attendee_matching.dart` (new)

## Steps

1. Offer a suggestion with a score; never link automatically below the threshold.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Unit tests of `attendee_matching.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
