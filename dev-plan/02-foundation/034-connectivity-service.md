# 034 — Connectivity service

**Phase** 02 · Project foundation  |  **Depends on** [025](025-result-and-failures.md)

## Goal

Report online, offline and metered so the UI and the queue can react.

## Files

- `lib/core/network/connectivity_service.dart` (new)

## Steps

1. Expose a stream of connectivity state with a manual offline override from settings.

## Acceptance

- [ ] Toggling airplane mode updates the state within a second.

## Tests

- Unit test with a fake connectivity source.
