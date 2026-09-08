# 288 — Processing queue screen

**Phase** 13 · Processing pipeline  |  **Depends on** [255](255-job-queue.md), [072](../03-design-system/072-app-progress-steps.md), [067](../03-design-system/067-async-value-view.md)

## Goal

The screen from the specification: counts, groups by context, and the two process actions.

## Files

- `lib/features/processing/presentation/queue_screen.dart` (new)

## Steps

1. Show unprocessed, queued and failed counts; group by context; per-group process action.

## Acceptance

- [ ] A user can process one facility at a time.

## Tests

- Widget test of grouping and counts.
