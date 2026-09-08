# 268 — Build the extraction request

**Phase** 13 · Processing pipeline  |  **Depends on** [263](263-ai-service-interface.md), [149](../09-templates/149-template-model.md), [259](259-ocr-on-device.md)

## Goal

Compose the request from the template field list, context, OCR text, captions and images.

## Files

- `lib/features/processing/domain/extraction_request.dart` (new)

## Steps

1. Include the explicit rules: only evidence-supported values, null when unknown, valid JSON.
2. Attach compressed copies, never originals.

## Acceptance

- [ ] The request matches the specification example in shape.

## Tests

- Golden test of a serialised request.
