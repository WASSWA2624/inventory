# 033 — Device identity and profile bootstrap

**Phase** 02 · Project foundation  |  **Depends on** [030](030-uuid-service.md), [029](029-clock-service.md)

## Goal

Create the stable device id and operator profile row on first launch.

## Files

- `lib/core/device/device_identity.dart` (new)

## Steps

1. Generate the device id once and persist it; expose device model and OS version for audit entries.

## Acceptance

- [ ] The device id survives restarts and never changes.

## Tests

- Unit test that a second call returns the first value.
