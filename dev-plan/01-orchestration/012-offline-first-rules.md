# 012 — Offline-first rules

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [004](004-architecture-rules.md)

## Goal

State the hard rules that keep the app usable with the radio off.

## Files

- `dev-plan/01-orchestration/_offline.md` (new)

## Steps

1. No screen may block on a network call; anything remote is queued and resumable.
2. Every write is local-first and durable before any UI confirmation is shown.
3. Online features degrade to a queued state with a plain explanation, never an error dialog.

## Acceptance

- [ ] Capture, review, records and export tasks can be tested with networking disabled.
