# 234 — Microphone permission flow

**Phase** 12 · Capture  |  **Depends on** [035](../02-foundation/035-permissions-service.md), [211](211-capture-screen.md)

## Goal

Ask for the microphone only when the user first taps the mic.

## Files

- `lib/features/capture/presentation/mic_permission_gate.dart` (new)

## Acceptance

- [ ] Refusing the microphone leaves typing fully available.
