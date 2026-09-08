# 313 — Add and remove photos after save

**Phase** 15 · Records  |  **Depends on** [311](311-record-detail.md), [223](../12-capture/223-photo-delete.md), [214](../12-capture/214-camera-shutter.md)

## Goal

Attach more evidence or remove a bad photo long after capture.

## Files

- `lib/features/records/presentation/record_photos_editor.dart` (new)

## Steps

1. Adding offers re-analysis; removing flags values whose evidence has gone.

## Acceptance

- [ ] Values are never silently deleted when their evidence is removed.

## Tests

- Test of the evidence-removed flag.
