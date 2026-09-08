# 262 — Retry and backoff

**Phase** 13 · Processing pipeline  |  **Depends on** [261](261-job-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Retry transient failures with backoff, and stop retrying permanent ones.

## Files

- `lib/features/processing/domain/job_retry.dart` (new)

## Steps

1. Classify failures as transient or permanent; cap attempts; surface the reason to the queue screen.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A provider outage does not burn the battery retrying in a tight loop.
- [ ] Tests written and passing: Unit tests over both failure classes.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
