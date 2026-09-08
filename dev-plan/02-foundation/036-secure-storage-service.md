# 036 — Secure storage service

**Phase** 02 · Project foundation  |  **Depends on** [014](../01-orchestration/014-security-policy.md), [025](025-result-and-failures.md)

## Goal

The only sanctioned home for keys and credentials.

## Files

- `lib/core/security/secure_storage.dart` (new)

## Steps

1. Wrap platform secure storage with typed accessors per secret kind and a delete-all for reset.
2. Assert in debug that no secret is written to the ordinary preferences store.

## Acceptance

- [ ] Secrets survive restart and are absent from any database or export.

## Tests

- Unit test with a fake backing store.
