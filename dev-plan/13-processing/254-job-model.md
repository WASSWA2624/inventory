# 254 — Processing job model and repository

**Phase** 13 · Processing pipeline  |  **Depends on** [099](../04-data-layer/099-jobs-table.md), [107](../04-data-layer/107-repository-interfaces.md)

## Goal

Model the queue: one job per record, with stage, attempts and outcome.

## Files

- `lib/features/processing/domain/processing_job.dart` (new)
- `lib/features/processing/data/processing_repository_impl.dart` (new)

## Steps

1. Stages: prepare, on-device, detect, online, normalise, validate.

## Tests

- Round-trip mapper test.
