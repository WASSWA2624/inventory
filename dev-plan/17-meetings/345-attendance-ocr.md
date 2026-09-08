# 345 — Read the attendance sheet

**Phase** 17 · Meeting mode  |  **Depends on** [344](344-attendance-photo.md), [259](../13-processing/259-ocr-on-device.md)

## Goal

Turn the photographed sheet into editable attendee rows.

## Files

- `lib/features/meetings/domain/attendance_ocr.dart` (new)

## Steps

1. Detect columns for name, title, organisation and signature presence; produce rows with confidence.

## Acceptance

- [ ] Every extracted row is editable and none is added silently.

## Tests

- Test against a fixture attendance sheet.
