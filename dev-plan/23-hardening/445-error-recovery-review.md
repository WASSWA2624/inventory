# 445 — Failure-path review

**Phase** 23 · Hardening  |  **Depends on** [007](../01-orchestration/007-error-handling-policy.md), [249](../12-capture/249-capture-recovery.md)

## Goal

Deliberately fail every external dependency and check the app stays usable.

## Steps

1. Test with the camera denied, storage full, provider down, key invalid, bundle corrupt and database locked.

## Acceptance

- [ ] Every failure leaves a recoverable state and an actionable message.

## Tests

- Integration tests per failure.
