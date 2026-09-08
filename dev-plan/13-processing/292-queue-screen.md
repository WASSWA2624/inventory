# 292 — Processing queue screen

**Phase** 13 · Processing pipeline  |  **Depends on** [260](260-job-queue.md), [076](../03-design-system/076-app-progress-steps.md), [071](../03-design-system/071-async-value-view.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The screen from the specification: counts, groups by context, and the two process actions.

## Files

- `frontend/lib/features/processing/presentation/queue_screen.dart` (new)

## Steps

1. Show unprocessed, queued and failed counts; group by context; per-group process action.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A user can process one facility at a time.
- [ ] Tests written and passing: Widget test of grouping and counts.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
