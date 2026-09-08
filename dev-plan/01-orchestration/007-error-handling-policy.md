# 007 — Error handling and user-facing failures

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [004](004-architecture-rules.md)

## Goal

Decide how failures travel: typed failures in domain, never raw exceptions crossing a layer.

## Files

- `dev-plan/01-orchestration/_errors.md` (new)

## Steps

1. Define the failure taxonomy: storage, permission, network, provider, validation, corruption, cancelled.
2. Every failure carries a plain-language message and a recovery action; unknown failures are logged and reported once.
3. Rule: capture and processing failures never discard user input.

## Acceptance

- [ ] Later tasks reference failure types by name rather than inventing new ones.
