# 394 — Automatic settlement rules

**Phase** 19 · Bundles and merge  |  **Depends on** [393](393-merge-field-level.md)

## Goal

The four rules that settle a conflict without asking.

## Files

- `lib/features/merge/domain/merge_rules.dart` (new)

## Steps

1. Verified beats unverified; barcode or reference beats inferred; non-empty beats never-edited empty; otherwise conflict.

## Acceptance

- [ ] Every automatic decision is recorded in the audit log with the rule that made it.

## Tests

- Unit tests per rule and for the fall-through.
