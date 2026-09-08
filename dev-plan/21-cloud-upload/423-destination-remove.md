# 423 — Remove a destination

**Phase** 21 · Manual cloud upload  |  **Depends on** [414](414-destination-list.md), [036](../02-foundation/036-secure-storage-service.md)

## Goal

Delete the destination and purge its credentials from secure storage.

## Files

- `lib/features/cloud/presentation/destination_remove_action.dart` (new)

## Acceptance

- [ ] Removing a destination leaves no credential behind.

## Tests

- Test that secure storage no longer holds the entry.
