# 032 — Isolate runner helper

**Phase** 02 · Project foundation  |  **Depends on** [022](022-folder-scaffold.md)

## Goal

One helper for moving heavy work off the UI thread.

## Files

- `lib/core/concurrency/isolate_runner.dart` (new)

## Steps

1. Wrap compute-style execution with cancellation, progress reporting and error mapping to Failure.

## Acceptance

- [ ] Image, export and merge tasks can run heavy work without freezing the interface.

## Tests

- Unit test for progress and cancellation.
