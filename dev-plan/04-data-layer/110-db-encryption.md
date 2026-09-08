# 110 — Optional database encryption

**Phase** 04 · Local database  |  **Depends on** [080](080-drift-setup.md), [036](../02-foundation/036-secure-storage-service.md)

## Goal

Let a user turn on encryption at rest without changing any query.

## Files

- `lib/core/db/encryption.dart` (new)

## Steps

1. Swap the connection for an encrypted one, holding the key in secure storage.
2. Migrate an existing plain database on enable, with progress and a safety copy.

## Acceptance

- [ ] Enabling encryption never loses data; disabling requires explicit confirmation.

## Tests

- Test that the encrypted database opens only with the key.
