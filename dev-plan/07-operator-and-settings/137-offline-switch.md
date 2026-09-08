# 137 — Manual offline mode switch

**Phase** 07 · Operator profile and settings  |  **Depends on** [034](../02-foundation/034-connectivity-service.md), [132](132-settings-store.md)

## Goal

One switch that blocks every outbound call.

## Files

- `lib/features/settings/presentation/offline_switch.dart` (new)

## Steps

1. When on, queue anything that would have gone online and say so in the status line.

## Acceptance

- [ ] With the switch on, no network call is made anywhere in the app.

## Tests

- Integration test asserting zero outbound calls.
