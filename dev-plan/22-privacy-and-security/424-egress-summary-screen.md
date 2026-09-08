# 424 — What leaves this device

**Phase** 22 · Privacy and security  |  **Depends on** [264](../13-processing/264-provider-registry.md), [414](../21-cloud-upload/414-destination-list.md)

## Goal

One screen listing every outbound path, its current state and what it sends.

## Files

- `lib/features/settings/presentation/egress_summary_screen.dart` (new)

## Steps

1. List AI extraction, OCR, speech, refinement and cloud upload, each with an on or off state.

## Acceptance

- [ ] A user can see and disable every outbound path from one place.
