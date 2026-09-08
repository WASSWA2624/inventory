# 392 — Entity-level merge

**Phase** 19 · Bundles and merge  |  **Depends on** [390](390-version-vector-service.md), [084](../04-data-layer/084-transaction-helper.md)

## Goal

Apply the insert, fast-forward, ignore and concurrent decisions from the specification.

## Files

- `lib/features/merge/domain/merge_entities.dart` (new)

## Steps

1. Process in dependency order: project, templates, reference, records, fields, files.

## Acceptance

- [ ] Importing the same bundle twice changes nothing the second time.

## Tests

- Idempotency test.
