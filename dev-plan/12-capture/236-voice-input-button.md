# 236 — Voice input button

**Phase** 12 · Capture  |  **Depends on** [235](235-stt-service.md), [052](../03-design-system/052-app-text-field.md)

## Goal

The microphone affordance attached to any long-text field.

## Files

- `lib/features/capture/presentation/voice_input_button.dart` (new)

## Steps

1. Show listening state and live partial text; stop on tap or silence.

## Acceptance

- [ ] The result lands in the field as editable text, never auto-submitted.
