# 225 — Rotate a photo

**Phase** 12 · Capture  |  **Depends on** [221](221-photo-viewer.md), [115](../05-file-storage/115-file-writer.md)

## Goal

Fix orientation without touching the original file.

## Files

- `lib/features/capture/domain/photo_rotate.dart` (new)

## Steps

1. Store the rotation as metadata and apply it to derived copies; leave the original bytes alone.

## Acceptance

- [ ] The original hash is unchanged after rotation.
