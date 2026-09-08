# 087 — Device profile table

**Phase** 04 · Local database  |  **Depends on** [082](082-column-mixins.md), [033](../02-foundation/033-device-identity.md)

## Goal

Persist the device id, operator name and preferences.

## Files

- `lib/core/db/tables/device_profile.dart` (new)

## Acceptance

- [ ] The profile row is created on first launch and never duplicated.
