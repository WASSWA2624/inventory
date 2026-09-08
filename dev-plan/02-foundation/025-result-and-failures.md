# 025 — Result type and failure taxonomy

**Phase** 02 · Project foundation  |  **Depends on** [007](../01-orchestration/007-error-handling-policy.md), [022](022-folder-scaffold.md)

## Goal

Give every fallible call one return shape.

## Files

- `lib/core/errors/failure.dart` (new)
- `lib/core/errors/result.dart` (new)

## Steps

1. Implement a sealed Failure hierarchy matching the taxonomy: storage, permission, network, provider, validation, corruption, cancelled.
2. Implement Result with success and failure branches and helpers for mapping and folding.

## Acceptance

- [ ] Domain methods return Result and never throw for expected conditions.

## Tests

- Unit tests for mapping, folding and equality.
