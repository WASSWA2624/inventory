# 200 — Cascade clearing

**Phase** 11 · Context fields  |  **Depends on** [199](199-context-level-picker.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Changing a higher level clears the levels below it, after one confirmation.

## Files

- `lib/features/context/domain/context_cascade.dart` (new)

## Steps

1. Show the one-line confirmation from the specification naming exactly what will clear.

## Acceptance

- [ ] Changing district never leaves a stale facility attached to new records.

## Tests

- Unit test of the cascade rules.
