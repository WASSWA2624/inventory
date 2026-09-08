# 432 — Automated secret leak test

**Phase** 22 · Privacy and security  |  **Depends on** [387](../19-bundles-and-merge/387-bundle-secret-exclusion.md), [027](../02-foundation/027-log-export-action.md)

## Goal

A test that scans exports, bundles and logs for secret-shaped strings.

## Files

- `test/security/secret_scan_test.dart` (new)

## Acceptance

- [ ] The suite fails if any artefact contains a key or credential.
