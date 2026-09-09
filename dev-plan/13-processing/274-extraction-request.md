# 274 — Build the extraction request

**Phase** 13 · Processing  |  **Depends on** [041](../02-foundation/041-ai-service-interface.md), [153](../09-templates/153-template-model.md), [266](266-ocr-on-device.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Compose the request from the template field list, context, OCR text, captions and images.

## Files

- `frontend/lib/features/processing/domain/extraction_request.dart` (new)

## Steps

1. Include the explicit rules: only evidence-supported values, null when unknown, valid JSON.
2. Attach compressed copies, never originals.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The request matches the specification example in shape.
- [ ] Tests written and passing: Golden test of a serialised request.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
