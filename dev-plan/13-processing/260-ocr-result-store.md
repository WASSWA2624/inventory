# 260 — Store OCR results

**Phase** 13 · Processing pipeline  |  **Depends on** [259](259-ocr-on-device.md), [099](../04-data-layer/099-jobs-table.md)

## Goal

Cache OCR output by image hash so it is never recomputed or re-uploaded.

## Files

- `lib/features/processing/data/ocr_cache.dart` (new)

## Acceptance

- [ ] Reprocessing a record reuses existing OCR text.

## Tests

- Test that a second run performs no recognition.
