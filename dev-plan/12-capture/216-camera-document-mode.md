# 216 — Document mode with edge detection

**Phase** 12 · Capture  |  **Depends on** [215](215-camera-controls.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

A capture mode tuned for paper: edge detection, perspective correction, higher contrast.

## Files

- `lib/features/capture/presentation/document_mode.dart` (new)

## Steps

1. Detect the page boundary and offer a corrected crop, keeping the original file.

## Acceptance

- [ ] The original photo is retained unchanged alongside the corrected copy.
