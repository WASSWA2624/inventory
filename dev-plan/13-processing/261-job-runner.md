# 261 — Job runner

**Phase** 13 · Processing pipeline  |  **Depends on** [260](260-job-queue.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Execute a job's stages in order, recording progress and stopping cleanly on cancel.

## Files

- `lib/features/processing/domain/job_runner.dart` (new)

## Steps

1. Persist stage completion so a resumed job does not redo finished work.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Cancelling mid-run leaves the record intact and the job resumable.
- [ ] Tests written and passing: Test that resume skips completed stages.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
