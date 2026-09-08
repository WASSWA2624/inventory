# 189 — Exact and case-insensitive matching

**Phase** 10 · Reference data and lookups  |  **Depends on** [188](188-lookup-binding-config.md)

## Goal

The fast path: match on key, then on normalised name.

## Files

- `lib/features/reference/domain/lookup_matcher.dart` (new)

## Tests

- Unit tests for key, case and whitespace variants.
