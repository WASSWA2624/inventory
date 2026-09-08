# 262 — Identifier pattern extraction

**Phase** 13 · Processing pipeline  |  **Depends on** [259](259-ocr-on-device.md), [149](../09-templates/149-template-model.md)

## Goal

Pull serials, asset tags and registrations out of OCR text using the template's patterns.

## Files

- `lib/features/processing/domain/identifier_extraction.dart` (new)

## Steps

1. Apply each identity field's pattern; rank candidates by position and confidence.

## Acceptance

- [ ] A record can be identified with no online call at all.

## Tests

- Unit tests over realistic plate text.
