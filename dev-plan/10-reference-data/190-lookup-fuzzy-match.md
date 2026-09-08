# 190 — Fuzzy matching

**Phase** 10 · Reference data and lookups  |  **Depends on** [189](189-lookup-exact-match.md)

## Goal

Tolerate typos and abbreviations, with a confidence score and a threshold.

## Files

- `lib/features/reference/domain/fuzzy_matcher.dart` (new)

## Steps

1. Use a normalised edit distance plus token overlap; expose the score to the caller.

## Acceptance

- [ ] A near miss offers a suggestion rather than filling silently.

## Tests

- Unit tests over a table of real-world name variants.
