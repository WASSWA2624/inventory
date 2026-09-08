# 129 — Global error and crash recovery screen

**Phase** 06 · Application shell  |  **Depends on** [028](../02-foundation/028-error-boundary-widget.md), [027](../02-foundation/027-log-export-action.md)

## Goal

A last-resort screen that keeps data safe and offers the log.

## Files

- `lib/app/widgets/global_error_page.dart` (new)

## Steps

1. Offer restart, export log and open recycle bin; never offer "clear data".

## Acceptance

- [ ] A fatal error cannot lead a user into destroying their work.
