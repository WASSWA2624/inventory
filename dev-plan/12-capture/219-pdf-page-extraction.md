# 219 — Extract PDF pages as evidence

**Phase** 12 · Capture  |  **Depends on** [218](218-document-picker.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Render each page so OCR and review can treat pages like photos.

## Files

- `lib/core/import/pdf_pages.dart` (new)

## Steps

1. Render pages lazily at a readable resolution into .cache, keeping the source PDF intact.

## Acceptance

- [ ] A twenty-page document does not stall the interface.

## Tests

- Test against a multi-page fixture.
