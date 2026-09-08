# 292 — Opportunistic on-device OCR

**Phase** 13 · Processing pipeline  |  **Depends on** [259](259-ocr-on-device.md), [037](../02-foundation/037-app-lifecycle-observer.md)

## Goal

Pre-read text on unprocessed records while charging, so online work is smaller later.

## Files

- `lib/features/processing/domain/background_ocr.dart` (new)

## Steps

1. Run only while charging and idle; stop immediately on resume.

## Acceptance

- [ ] Battery use is negligible and no network is used.
