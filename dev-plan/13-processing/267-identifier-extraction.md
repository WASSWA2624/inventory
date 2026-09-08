# 267 — Identifier pattern extraction

**Phase** 13 · Processing pipeline  |  **Depends on** [264](264-ocr-on-device.md), [153](../09-templates/153-template-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Pull serials, asset tags and registrations out of OCR text using the template's patterns.

## Files

- `lib/features/processing/domain/identifier_extraction.dart` (new)

## Steps

1. Apply each identity field's pattern; rank candidates by position and confidence.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A record can be identified with no online call at all.
- [ ] Tests written and passing: Unit tests over realistic plate text.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
