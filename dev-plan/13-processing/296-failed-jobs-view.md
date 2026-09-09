# 296 — Failed jobs and retry

**Phase** 13 · Processing  |  **Depends on** [295](295-process-actions.md), [264](264-job-retry.md), [069](../03-design-system/069-app-error-state.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

List failures with reasons and one-tap retry.

## Files

- `frontend/lib/features/processing/presentation/failed_jobs_screen.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A failed job never damages the raw record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
