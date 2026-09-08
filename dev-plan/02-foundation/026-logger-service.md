# 026 — Logger service

**Phase** 02 · Project foundation  |  **Depends on** [008](../01-orchestration/008-logging-policy.md), [023](023-app-bootstrap.md)

## Goal

A single logger with levels, a ring buffer and redaction.

## Files

- `lib/core/logging/logger.dart` (new)

## Steps

1. Implement levels, tags and a bounded in-memory buffer persisted to a rotating file.
2. Redact anything matching key or credential patterns before writing.

## Acceptance

- [ ] Logs are readable in debug, bounded in release, and contain no secrets.

## Tests

- Unit test proving redaction and buffer bounds.
