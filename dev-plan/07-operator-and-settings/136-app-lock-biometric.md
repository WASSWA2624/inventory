# 136 — Biometric unlock

**Phase** 07 · Operator profile and settings  |  **Depends on** [135](135-app-lock-pin.md)

## Goal

Offer biometrics where the device supports it, with the PIN as fallback.

## Files

- `lib/features/settings/data/biometric_lock.dart` (new)

## Acceptance

- [ ] Failing biometrics falls back to the PIN, never to no lock.
