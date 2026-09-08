# 339 — Project quality summary

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [331](331-duplicates-screen.md), [337](337-variance-screen.md), [320](320-validation-engine.md)

## Goal

One screen answering what still blocks a clean export.

## Files

- `lib/features/quality/presentation/quality_summary_screen.dart` (new)

## Steps

1. Counts of invalid records, unresolved duplicates, unresolved conflicts and unreviewed records, each tappable.

## Acceptance

- [ ] A user can reach export-ready state by clearing this list.
