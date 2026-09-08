# 303 — Re-analyse a record

**Phase** 14 · Review and approval  |  **Depends on** [255](../13-processing/255-job-queue.md), [272](../13-processing/272-proposal-application.md)

## Goal

Run processing again without discarding human work.

## Files

- `lib/features/review/presentation/reanalyse_action.dart` (new)

## Steps

1. Present results as a diff of proposed changes; verified fields are never changed silently.

## Acceptance

- [ ] The user chooses which proposed changes to accept.

## Tests

- Test that a verified field is offered, not applied.
