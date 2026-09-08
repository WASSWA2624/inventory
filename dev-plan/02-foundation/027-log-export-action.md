# 027 — Export diagnostics log

**Phase** 02 · Project foundation  |  **Depends on** [026](026-logger-service.md)

## Goal

Let a user hand over a log file when something goes wrong, without a support server.

## Files

- `lib/core/logging/log_export.dart` (new)

## Steps

1. Write the buffer to a text file and offer it to the share sheet.

## Acceptance

- [ ] The exported file contains no record values and no credentials.
