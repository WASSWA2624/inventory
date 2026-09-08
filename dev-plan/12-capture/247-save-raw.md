# 247 — Save raw, analyse later

**Phase** 12 · Capture  |  **Depends on** [246](246-save-immediate.md)

## Goal

The deferred path: save evidence, set status CAPTURED, run nothing.

## Files

- `lib/features/capture/domain/save_raw.dart` (new)

## Steps

1. Make no network call and no AI call of any kind.

## Acceptance

- [ ] Forty records can be captured offline in sequence with no processing.

## Tests

- Integration test asserting zero outbound calls.
