# 212 — Camera permission flow

**Phase** 12 · Capture  |  **Depends on** [035](../02-foundation/035-permissions-service.md), [211](211-capture-screen.md)

## Goal

Ask once, explain why, and recover gracefully from refusal.

## Files

- `lib/features/capture/presentation/camera_permission_gate.dart` (new)

## Steps

1. On refusal, keep gallery and typed capture available.

## Acceptance

- [ ] A user who denies the camera can still work.
