# 426 — Do not send images

**Phase** 22 · Privacy and security  |  **Depends on** [425](425-ai-disable-per-project.md), [259](../13-processing/259-ocr-on-device.md)

## Goal

Force on-device OCR only, sending no image anywhere.

## Files

- `lib/features/projects/presentation/image_egress_switch.dart` (new)

## Acceptance

- [ ] With the switch on, extraction uses text only and says so.
