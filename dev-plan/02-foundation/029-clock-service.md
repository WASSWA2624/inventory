# 029 — Injectable clock

**Phase** 02 · Project foundation  |  **Depends on** [022](022-folder-scaffold.md)

## Goal

Make time a dependency so timestamps are testable and consistently UTC.

## Files

- `lib/core/time/clock.dart` (new)

## Steps

1. Expose nowUtc(), today() and the device offset; provide a fixed clock for tests.
2. Rule: no code calls DateTime.now() directly after this task.

## Acceptance

- [ ] A test can freeze time and assert stamped values.

## Tests

- Unit test of the fixed clock.
