# 287 — Budget guard and request counter

**Phase** 13 · Processing pipeline  |  **Depends on** [255](255-job-queue.md), [132](../07-operator-and-settings/132-settings-store.md)

## Goal

Let a project cap how much processing it will do, and show what has been used.

## Files

- `lib/features/processing/domain/cost_guard.dart` (new)

## Steps

1. Optional daily record cap; running counters for requests and images; block with a clear message at the cap.

## Acceptance

- [ ] A user can always see how many calls have been made today.
