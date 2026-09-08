# 053 — Number field

**Phase** 03 · Design system  |  **Depends on** [052](052-app-text-field.md)

## Goal

Numeric entry with unit suffix, decimal control and range hints.

## Files

- `lib/core/widgets/fields/app_number_field.dart` (new)

## Steps

1. Use the numeric keyboard, reject invalid characters, and display the field unit from the template.

## Acceptance

- [ ] Typing letters is impossible; out-of-range values show the shared error style.
