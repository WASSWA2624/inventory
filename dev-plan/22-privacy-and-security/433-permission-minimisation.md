# 433 — Permission minimisation review

**Phase** 22 · Privacy and security  |  **Depends on** [035](../02-foundation/035-permissions-service.md)

## Goal

Request only what is needed, only when it is needed, and document why.

## Files

- `lib/core/permissions/permission_rationale.dart` (new)

## Steps

1. Audit the manifest; remove any permission not tied to a shipped feature.

## Acceptance

- [ ] A fresh install requests no permission before the user does something requiring it.
