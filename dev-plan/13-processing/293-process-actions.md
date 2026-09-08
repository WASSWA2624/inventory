# 293 — Process all and process selected

**Phase** 13 · Processing pipeline  |  **Depends on** [292](292-queue-screen.md), [261](261-job-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Start processing with clear progress and a cancel action.

## Files

- `lib/features/processing/presentation/process_actions.dart` (new)

## Steps

1. Show per-record progress; allow cancel; report a summary of succeeded and failed at the end.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Interrupting a batch keeps everything already processed.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
