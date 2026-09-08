# 122 — Imported file validation

**Phase** 05 · File storage  |  **Depends on** [014](../01-orchestration/014-security-policy.md), [025](../02-foundation/025-result-and-failures.md)

## Goal

Validate anything arriving from outside before it is read.

## Files

- `lib/core/files/file_validation.dart` (new)

## Steps

1. Check extension, sniff the magic bytes, enforce size limits, and reject archives that unpack outside their root.

## Acceptance

- [ ] A renamed or hostile file is refused with a clear message.

## Tests

- Unit tests over crafted bad inputs.
