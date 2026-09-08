# 430 — GPS consent and control

**Phase** 22 · Privacy and security  |  **Depends on** [244](../12-capture/244-gps-capture.md), [424](424-egress-summary-screen.md)

## Goal

Keep location off by default and easy to strip.

## Files

- `lib/features/settings/presentation/gps_privacy_section.dart` (new)

## Steps

1. Offer removing coordinates from existing records and excluding them from exports.

## Acceptance

- [ ] A project can be delivered with no location data at all.
