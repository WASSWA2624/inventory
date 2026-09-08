# 386 — Optional bundle encryption

**Phase** 19 · Bundles and merge  |  **Depends on** [384](384-bundle-writer.md), [036](../02-foundation/036-secure-storage-service.md)

## Goal

Password-protect a bundle that will travel on removable media.

## Files

- `lib/core/bundle/bundle_encryption.dart` (new)

## Steps

1. Encrypt the archive with a user-supplied password; never store the password.

## Acceptance

- [ ] A wrong password fails cleanly without partial extraction.
