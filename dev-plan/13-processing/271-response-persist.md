# 271 — Persist raw provider responses

**Phase** 13 · Processing pipeline  |  **Depends on** [269](269-response-parse.md), [099](../04-data-layer/099-jobs-table.md)

## Goal

Keep what the provider actually said, for audit and reprocessing.

## Files

- `lib/features/processing/data/response_store.dart` (new)

## Steps

1. Store the raw response and a request summary; never store the key.

## Acceptance

- [ ] A record can be reprocessed from stored output with no new call.
