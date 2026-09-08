# 035 — Runtime permissions service

**Phase** 02 · Project foundation  |  **Depends on** [025](025-result-and-failures.md)

## Goal

One place that asks for camera, microphone, location and storage, and explains refusals.

## Files

- `lib/core/permissions/permissions_service.dart` (new)

## Steps

1. Wrap each permission with request, status and a rationale string.
2. Handle permanent denial by offering the system settings page.

## Acceptance

- [ ] A denied permission produces a recoverable message, never a crash.

## Tests

- Unit test with a fake permission source.
