# 256 — Job runner

**Phase** 13 · Processing pipeline  |  **Depends on** [255](255-job-queue.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Execute a job's stages in order, recording progress and stopping cleanly on cancel.

## Files

- `lib/features/processing/domain/job_runner.dart` (new)

## Steps

1. Persist stage completion so a resumed job does not redo finished work.

## Acceptance

- [ ] Cancelling mid-run leaves the record intact and the job resumable.

## Tests

- Test that resume skips completed stages.
