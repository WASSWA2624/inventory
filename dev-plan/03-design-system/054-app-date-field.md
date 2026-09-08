# 054 — Date, time and date-time field

**Phase** 03 · Design system  |  **Depends on** [052](052-app-text-field.md), [029](../02-foundation/029-clock-service.md)

## Goal

One control for all three temporal types, defaulting to now.

## Files

- `lib/core/widgets/fields/app_date_field.dart` (new)

## Steps

1. Show the formatted value with a picker; support clearing; mark auto-filled values with the auto affordance.

## Acceptance

- [ ] Auto-filled dates are visibly distinct from typed ones.

## Tests

- Widget test with a frozen clock.
