# 250 — Image quality warnings

**Phase** 12 · Capture  |  **Depends on** [214](214-camera-shutter.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

Advisory checks for blur, darkness, overexposure and small text.

## Files

- `lib/features/capture/domain/image_quality.dart` (new)

## Steps

1. Score the image after capture; show a non-blocking hint with retake and keep options.

## Acceptance

- [ ] A warning never prevents saving.

## Tests

- Unit tests over dark, blurry and clean fixtures.
