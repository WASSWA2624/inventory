# 246 — Capture and analyse

**Phase** 12 · Capture  |  **Depends on** [210](210-capture-session-controller.md), [099](../04-data-layer/099-jobs-table.md)

## Goal

Save the record and queue it for immediate processing.

## Files

- `lib/features/capture/domain/save_and_analyse.dart` (new)

## Steps

1. Persist everything first, then enqueue; if enqueueing fails the record still exists.

## Acceptance

- [ ] Losing connectivity between save and enqueue never loses the record.

## Tests

- Test that a failed enqueue leaves a complete CAPTURED record.
