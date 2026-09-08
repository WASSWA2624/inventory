# 217 — Pick photos from the gallery

**Phase** 12 · Capture  |  **Depends on** [210](210-capture-session-controller.md), [122](../05-file-storage/122-file-validation.md)

## Goal

Import existing images into the session, copying them into the project tree.

## Files

- `lib/features/capture/presentation/gallery_picker.dart` (new)

## Steps

1. Multi-select; copy rather than reference; preserve the original filename in metadata.

## Acceptance

- [ ] Deleting the photo from the gallery afterwards does not affect the record.
