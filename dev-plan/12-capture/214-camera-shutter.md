# 214 — Shutter and immediate save

**Phase** 12 · Capture  |  **Depends on** [213](213-camera-preview.md), [115](../05-file-storage/115-file-writer.md), [114](../05-file-storage/114-photo-path-builder.md)

## Goal

Take a photo, write it to the right folder, and be ready for the next shot.

## Files

- `lib/features/capture/domain/take_photo.dart` (new)

## Steps

1. Write the file, hash it, insert the row and add it to the session, all off the UI thread.
2. Give haptic and visual confirmation without blocking the preview.

## Acceptance

- [ ] Shutter to ready is under 400 milliseconds on a mid-range device.

## Tests

- Integration test that ten rapid shots produce ten files and ten rows.
