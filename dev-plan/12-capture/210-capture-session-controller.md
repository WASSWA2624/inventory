# 210 — Capture session controller

**Phase** 12 · Capture  |  **Depends on** [209](209-capture-session-model.md), [006](../01-orchestration/006-state-management-conventions.md)

## Goal

The controller that owns the session and writes through to storage immediately.

## Files

- `lib/features/capture/presentation/capture_controller.dart` (new)

## Steps

1. Persist each addition (photo, caption, value) as it happens, not on save.

## Acceptance

- [ ] Killing the app mid-session loses at most the last keystroke.

## Tests

- Test that a photo added is on disk and in the database before the next frame.
