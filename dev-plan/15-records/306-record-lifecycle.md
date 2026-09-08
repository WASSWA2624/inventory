# 306 — Record status lifecycle

**Phase** 15 · Records  |  **Depends on** [305](305-record-model.md), [013](../01-orchestration/013-data-safety-rules.md)

## Goal

Implement the one canonical status set and the legal transitions between them.

## Files

- `lib/features/records/domain/record_lifecycle.dart` (new)

## Steps

1. Statuses: DRAFT, CAPTURED, QUEUED, PROCESSING, EXTRACTED, NEEDS_REVIEW, APPROVED, FAILED, ARCHIVED, DELETED.
2. Export is a timestamp and an export membership, never a status.
3. Reject illegal transitions with a validation failure rather than silently allowing them.

## Acceptance

- [ ] Manual records go DRAFT to NEEDS_REVIEW to APPROVED without touching processing states.

## Tests

- Unit tests over the full transition table.
