# 132 — Settings store

**Phase** 07 · Operator profile and settings  |  **Depends on** [024](../02-foundation/024-app-constants.md), [087](../04-data-layer/087-device-profile-table.md)

## Goal

One typed store for app-wide preferences with defaults and migration.

## Files

- `lib/features/settings/data/settings_store.dart` (new)

## Steps

1. Typed keys with defaults; a change stream so screens react immediately.

## Acceptance

- [ ] No feature reads preferences by raw string key.

## Tests

- Unit test of defaults and change notification.
