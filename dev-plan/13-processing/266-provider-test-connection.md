# 266 — Test connection

**Phase** 13 · Processing pipeline  |  **Depends on** [265](265-api-key-entry.md)

## Goal

A single call that proves the key and endpoint work, with a clear result.

## Files

- `lib/features/settings/presentation/provider_test_action.dart` (new)

## Steps

1. Send the smallest possible request; report success, auth failure or network failure distinctly.
