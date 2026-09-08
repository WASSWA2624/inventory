# 013 — Data safety and durability rules

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [012](012-offline-first-rules.md)

## Goal

Protect the two things that cannot be recreated: raw evidence and user corrections.

## Files

- `dev-plan/01-orchestration/_data_safety.md` (new)

## Steps

1. Raw values, captions, transcripts and original photos are append-only; refinement writes a separate column.
2. Deletes are tombstones; files are removed only by the purge job after the retention window.
3. Every schema change ships with a migration and a migration test; no destructive migration without an export prompt.

## Acceptance

- [ ] Any task that touches storage states which of these rules applies to it.
