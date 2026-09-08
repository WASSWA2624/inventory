# 272 — Apply proposals to a record

**Phase** 13 · Processing pipeline  |  **Depends on** [269](269-response-parse.md), [094](../04-data-layer/094-record-fields-table.md), [013](../01-orchestration/013-data-safety-rules.md)

## Goal

Write extracted values as proposals, never as approved data.

## Files

- `lib/features/processing/domain/proposal_application.dart` (new)

## Steps

1. Write valueRaw with source and confidence; never overwrite a verified or manual value.
2. Set the record status to NEEDS_REVIEW when anything is uncertain.

## Acceptance

- [ ] A verified field survives reprocessing untouched.

## Tests

- Test that verified values are preserved.
