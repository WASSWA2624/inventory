# 289 — Process all and process selected

**Phase** 13 · Processing pipeline  |  **Depends on** [288](288-queue-screen.md), [256](256-job-runner.md)

## Goal

Start processing with clear progress and a cancel action.

## Files

- `lib/features/processing/presentation/process_actions.dart` (new)

## Steps

1. Show per-record progress; allow cancel; report a summary of succeeded and failed at the end.

## Acceptance

- [ ] Interrupting a batch keeps everything already processed.
