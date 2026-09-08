# 209 — Capture session model

**Phase** 12 · Capture  |  **Depends on** [093](../04-data-layer/093-records-table.md), [095](../04-data-layer/095-photos-table.md), [030](../02-foundation/030-uuid-service.md)

## Goal

The in-progress session that holds photos, captions and typed values before and after the first save.

## Files

- `lib/features/capture/domain/capture_session.dart` (new)

## Steps

1. Model session id, template, context snapshot, photo list, captions, field values and dirty state.
2. Every mutation is a method on the controller; widgets never edit the model directly.

## Acceptance

- [ ] A session can be serialised, restored and resumed after a crash.

## Tests

- Unit tests of every mutation.
