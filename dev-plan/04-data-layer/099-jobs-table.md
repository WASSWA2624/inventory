# 099 — Processing jobs and results tables

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md)

## Goal

The deferred queue and the raw provider responses kept for audit.

## Files

- `lib/core/db/tables/processing.dart` (new)

## Steps

1. Jobs: recordId, stage, status, attempts, lastError, queuedAt, startedAt, finishedAt, provider, model.
2. Results: jobId, requestSummary, rawResponse, parsedOk, tokensOrCost.
3. Index on status plus queuedAt so the queue screen is cheap.
