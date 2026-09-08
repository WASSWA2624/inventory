# 264 — On-device OCR

**Phase** 13 · Processing pipeline  |  **Depends on** [263](263-image-preprocessing.md), [005](../01-orchestration/005-dependency-allowlist.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Extract text and blocks locally, with no network.

## Files

- `lib/core/ai/ocr_service.dart` (new)

## Steps

1. Return text, blocks and bounding boxes; run in an isolate; work with the radio off.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A rating plate photo yields readable text offline.
- [ ] Tests written and passing: Test against a fixture image with known text.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
