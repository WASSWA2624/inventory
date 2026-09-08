# 265 — Store OCR results

**Phase** 13 · Processing pipeline  |  **Depends on** [264](264-ocr-on-device.md), [103](../04-data-layer/103-jobs-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Cache OCR output by image hash so it is never recomputed or re-uploaded.

## Files

- `lib/features/processing/data/ocr_cache.dart` (new)

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Reprocessing a record reuses existing OCR text.
- [ ] Tests written and passing: Test that a second run performs no recognition.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
