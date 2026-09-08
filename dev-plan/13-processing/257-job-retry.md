# 257 — Retry and backoff

**Phase** 13 · Processing pipeline  |  **Depends on** [256](256-job-runner.md)

## Goal

Retry transient failures with backoff, and stop retrying permanent ones.

## Files

- `lib/features/processing/domain/job_retry.dart` (new)

## Steps

1. Classify failures as transient or permanent; cap attempts; surface the reason to the queue screen.

## Acceptance

- [ ] A provider outage does not burn the battery retrying in a tight loop.

## Tests

- Unit tests over both failure classes.
