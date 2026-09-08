# 289 — Skip the online stage when possible

**Phase** 13 · Processing pipeline  |  **Depends on** [267](267-identifier-extraction.md), [197](../10-reference-data/197-lookup-prefill-apply.md), [261](261-job-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Do not pay for a call when local extraction plus a reference match already fills the record.

## Files

- `frontend/lib/features/processing/domain/online_skip_rule.dart` (new)

## Steps

1. Skip when every required field is filled and confident; record the skip reason on the job.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A scanned known asset completes with no online call.
- [ ] Tests written and passing: Test proving zero calls on the fully matched path.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
