# 304 — Batch review flow

**Phase** 14 · Review and approval  |  **Depends on** [302](302-approve-record.md)

## Goal

Move through a filtered queue of records with one action per record.

## Files

- `lib/features/review/presentation/batch_review_screen.dart` (new)

## Steps

1. Keep a position indicator, allow skip, and support back without losing edits.

## Acceptance

- [ ] Forty records can be reviewed without returning to a list between each.
