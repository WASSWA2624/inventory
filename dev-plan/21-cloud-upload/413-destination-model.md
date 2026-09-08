# 413 — Cloud destination model

**Phase** 21 · Manual cloud upload  |  **Depends on** [036](../02-foundation/036-secure-storage-service.md), [107](../04-data-layer/107-repository-interfaces.md)

## Goal

Model a destination: kind, label, folder and a credential reference held in secure storage.

## Files

- `lib/features/cloud/domain/cloud_destination.dart` (new)

## Steps

1. Store only the reference in the database; the credential itself lives in secure storage.

## Acceptance

- [ ] No credential value is ever written to the database.

## Tests

- Test asserting the database contains no secret.
