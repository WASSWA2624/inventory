# 333 — Resolve a source conflict

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [332](332-source-conflict-detection.md), [294](../14-review/294-review-screen.md)

## Goal

Present each candidate with its source and let the user choose or type another.

## Files

- `lib/features/quality/presentation/conflict_resolution_row.dart` (new)

## Steps

1. Show the evidence behind each candidate; record the chosen value and the reason.

## Acceptance

- [ ] A record cannot be approved with an unresolved conflict.
