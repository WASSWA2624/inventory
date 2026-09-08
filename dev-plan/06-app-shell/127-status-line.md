# 127 — Global status line

**Phase** 06 · Application shell  |  **Depends on** [124](124-nav-shell.md), [034](../02-foundation/034-connectivity-service.md), [059](../03-design-system/059-app-chip.md)

## Goal

One line that always says where you are and what is pending.

## Files

- `lib/app/widgets/status_line.dart` (new)

## Steps

1. Show current context summary, pinned template, online state and unprocessed count.
2. Tapping a segment navigates to the thing it describes.

## Acceptance

- [ ] The user can answer "where am I and what is queued" without leaving the screen.
