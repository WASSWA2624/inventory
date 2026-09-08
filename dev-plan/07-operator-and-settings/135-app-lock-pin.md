# 135 — App lock with PIN

**Phase** 07 · Operator profile and settings  |  **Depends on** [036](../02-foundation/036-secure-storage-service.md), [131](131-settings-shell.md)

## Goal

Optional PIN gate on launch and resume.

## Files

- `lib/features/settings/presentation/app_lock_screen.dart` (new)

## Steps

1. Set, change and remove a PIN; rate-limit attempts; never store the PIN in plain form.

## Acceptance

- [ ] Forgetting the PIN cannot silently wipe data; the recovery path is explained.

## Tests

- Unit test of hashing and attempt limiting.
