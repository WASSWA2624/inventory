# 008 — Logging and diagnostics

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [007](007-error-handling-policy.md)

## Goal

Fix what is logged, at what level, and what may never be logged.

## Files

- `dev-plan/01-orchestration/_logging.md` (new)

## Steps

1. Levels: trace for pipeline steps, info for user actions, warn for recoverable, error for failures.
2. Never log API keys, cloud credentials, record values, captions or file contents.
3. Logs are local only, ring-buffered, and exportable by the user for support.

## Acceptance

- [ ] A reviewer can tell at a glance whether a log line is permitted.
