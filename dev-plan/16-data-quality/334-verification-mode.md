# 334 — Verification mode switch

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [145](../08-projects/145-project-settings.md), [241](../12-capture/241-identifier-lookup.md)

## Goal

Switch a project or session into confirming existing data rather than creating it.

## Files

- `lib/features/quality/presentation/verification_mode_toggle.dart` (new)

## Steps

1. When on, capture starts from an identifier and prefilled record.

## Acceptance

- [ ] The mode is visible in the status line so no one forgets it is on.
