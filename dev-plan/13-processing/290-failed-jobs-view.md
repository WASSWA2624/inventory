# 290 — Failed jobs and retry

**Phase** 13 · Processing pipeline  |  **Depends on** [289](289-process-actions.md), [257](257-job-retry.md), [065](../03-design-system/065-app-error-state.md)

## Goal

List failures with reasons and one-tap retry.

## Files

- `lib/features/processing/presentation/failed_jobs_screen.dart` (new)

## Acceptance

- [ ] A failed job never damages the raw record.
