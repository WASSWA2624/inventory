# 255 — Queue service

**Phase** 13 · Processing pipeline  |  **Depends on** [254](254-job-model.md), [084](../04-data-layer/084-transaction-helper.md)

## Goal

Enqueue, claim, complete and fail jobs safely with a single runner.

## Files

- `lib/features/processing/domain/job_queue.dart` (new)

## Steps

1. Claim atomically so two runners cannot take the same job; cap concurrency from settings.

## Acceptance

- [ ] Killing the app mid-job leaves the job claimable again, not lost.

## Tests

- Test that a crashed claim is released after the timeout.
