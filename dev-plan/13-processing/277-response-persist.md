# 277 — Persist raw provider responses

**Phase** 13 · Processing  |  **Depends on** [275](275-response-parse.md), [103](../04-data-layer/103-jobs-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Keep what the provider actually said, for audit and reprocessing.

## Files

- `frontend/lib/features/processing/data/response_store.dart` (new)

## Steps

1. Store the raw response and a request summary; never store the key.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record can be reprocessed from stored output with no new call.
- [ ] Tests written and passing: Repository tests for `response_store.dart` against an in-memory database, plus the fake later tests use.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
