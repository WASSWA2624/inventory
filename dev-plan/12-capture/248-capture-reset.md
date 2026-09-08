# 248 — Reset for the next item

**Phase** 12 · Capture  |  **Depends on** [247](247-save-raw.md), [197](../11-context/197-context-persistence.md)

## Goal

Clear the session but keep context, pinned template and camera settings.

## Files

- `lib/features/capture/domain/capture_reset.dart` (new)

## Acceptance

- [ ] Capturing the next item requires no re-selection of anything.

## Tests

- Test that context and template survive a save.
