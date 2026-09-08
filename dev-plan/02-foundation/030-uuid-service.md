# 030 — UUIDv7 identifier service

**Phase** 02 · Project foundation  |  **Depends on** [022](022-folder-scaffold.md)

## Goal

Time-ordered globally unique identifiers, generated on device, ready for merge.

## Files

- `lib/core/ids/uuid_service.dart` (new)

## Steps

1. Implement or wrap UUIDv7 generation; expose a deterministic generator for tests.

## Acceptance

- [ ] Identifiers sort chronologically and never collide across devices.

## Tests

- Unit test asserting monotonic ordering and uniqueness across a large batch.
