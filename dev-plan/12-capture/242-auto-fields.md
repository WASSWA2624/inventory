# 242 — Automatic field application

**Phase** 12 · Capture  |  **Depends on** [210](210-capture-session-controller.md), [029](../02-foundation/029-clock-service.md), [033](../02-foundation/033-device-identity.md)

## Goal

Fill date, time, captured-at, record number, operator and device without user input.

## Files

- `lib/features/capture/domain/auto_fields.dart` (new)

## Steps

1. Apply on first save; mark values with source AUTO and the auto affordance.
2. Respect each template field's autoFill setting and the project date format.

## Acceptance

- [ ] A record captured with no typing still carries a complete timestamp and operator.

## Tests

- Test with a frozen clock asserting every automatic value.
