# 387 — Exclude secrets from bundles

**Phase** 19 · Bundles and merge  |  **Depends on** [384](384-bundle-writer.md), [014](../01-orchestration/014-security-policy.md)

## Goal

Guarantee no key, credential or device secret is ever written into a bundle.

## Files

- `lib/core/bundle/bundle_redaction.dart` (new)

## Acceptance

- [ ] An automated test scans every produced bundle for secret patterns.

## Tests

- Test that fails if any secret-shaped string is present.
