# 213 — Camera preview

**Phase** 12 · Capture  |  **Depends on** [212](212-camera-permission-flow.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

A responsive, correctly oriented preview that starts fast.

## Files

- `lib/features/capture/presentation/camera_view.dart` (new)

## Steps

1. Handle rotation, aspect ratio and surface disposal on background.

## Acceptance

- [ ] Returning from background restores the preview without a black frame.
