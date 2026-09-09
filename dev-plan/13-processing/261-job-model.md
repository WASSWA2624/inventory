# 261 — Processing job model and repository

**Phase** 13 · Processing  |  **Depends on** [103](../04-data-layer/103-jobs-table.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Model the queue: one job per record, with stage, attempts and outcome.

## Files

- `frontend/lib/features/processing/domain/processing_job.dart` (new)
- `frontend/lib/features/processing/data/processing_repository_impl.dart` (new)

## Steps

1. Stages: prepare, on-device, detect, online, normalise, validate.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Round-trip mapper test.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
