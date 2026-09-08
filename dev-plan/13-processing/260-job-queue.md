# 260 — Queue service

**Phase** 13 · Processing pipeline  |  **Depends on** [259](259-job-model.md), [088](../04-data-layer/088-transaction-helper.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Enqueue, claim, complete and fail jobs safely with a single runner.

## Files

- `lib/features/processing/domain/job_queue.dart` (new)

## Steps

1. Claim atomically so two runners cannot take the same job; cap concurrency from settings.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Killing the app mid-job leaves the job claimable again, not lost.
- [ ] Tests written and passing: Test that a crashed claim is released after the timeout.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
