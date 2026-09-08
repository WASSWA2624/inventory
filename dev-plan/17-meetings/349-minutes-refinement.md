# 349 — Refine the minutes

**Phase** 17 · Meeting mode  |  **Depends on** [348](348-meeting-transcription.md), [283](../13-processing/283-caption-refinement.md)

## Goal

Turn raw notes and transcript into structured minutes on request.

## Files

- `lib/features/meetings/domain/minutes_refinement.dart` (new)

## Steps

1. Produce discussion summaries, decisions and actions with owners and dates.
2. Forbid inventing attendees, decisions or actions absent from the raw material.

## Acceptance

- [ ] Raw notes and refined minutes are shown side by side and both are editable.

## Tests

- Test that a fabricated action is rejected by the guard.
