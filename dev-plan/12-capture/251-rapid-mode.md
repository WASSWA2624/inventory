# 251 — Rapid capture mode

**Phase** 12 · Capture  |  **Depends on** [247](247-save-raw.md), [248](248-capture-reset.md), [220](220-photo-tray.md)

## Goal

The high-speed loop from the specification: item after item without leaving the camera.

## Files

- `lib/features/capture/presentation/rapid_mode_screen.dart` (new)

## Steps

1. One tap ends an item and starts the next; show a running list of items with photo counts.
2. Nothing is analysed until the operator asks.

## Acceptance

- [ ] Four items with photos can be captured in under a minute.

## Tests

- Integration test of a four-item run.
