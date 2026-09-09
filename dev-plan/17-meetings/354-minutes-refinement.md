# 354 — Refine the minutes

**Phase** 17 · Meetings  |  **Depends on** [353](353-meeting-transcription.md), [289](../13-processing/289-caption-refinement.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn raw notes and transcript into structured minutes on request.

## Files

- `frontend/lib/features/meetings/domain/minutes_refinement.dart` (new)

## Steps

1. Produce discussion summaries, decisions and actions with owners and dates.
2. Forbid inventing attendees, decisions or actions absent from the raw material.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Raw notes and refined minutes are shown side by side and both are editable.
- [ ] Tests written and passing: Test that a fabricated action is rejected by the guard.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
