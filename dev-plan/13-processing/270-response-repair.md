# 270 — Repair and retry a bad response

**Phase** 13 · Processing pipeline  |  **Depends on** [269](269-response-parse.md), [257](257-job-retry.md)

## Goal

One repair attempt before declaring the job failed.

## Files

- `lib/features/processing/domain/response_repair.dart` (new)

## Steps

1. Re-request with the parse error described; fail the job after one repair.

## Acceptance

- [ ] Failure leaves the raw response stored for inspection.
