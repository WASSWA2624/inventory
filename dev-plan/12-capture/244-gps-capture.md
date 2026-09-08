# 244 — Optional GPS capture

**Phase** 12 · Capture  |  **Depends on** [035](../02-foundation/035-permissions-service.md), [132](../07-operator-and-settings/132-settings-store.md)

## Goal

Record coordinates and accuracy when, and only when, the project enables it.

## Files

- `lib/features/capture/domain/gps_capture.dart` (new)

## Steps

1. Time-box the fix; store accuracy; never block saving on a slow fix.

## Acceptance

- [ ] With GPS off, no location permission is requested anywhere.

## Tests

- Test that the disabled path makes no location call.
