# 293 — Processing notifications

**Phase** 13 · Processing pipeline  |  **Depends on** [255](255-job-queue.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Tell the user when a batch finishes or fails, locally.

## Files

- `lib/features/processing/data/notifications.dart` (new)

## Steps

1. Local notifications only, with a tap target that opens the review list.
