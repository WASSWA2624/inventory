# 278 — Normalise dates and numbers

**Phase** 13 · Processing pipeline  |  **Depends on** [276](276-normalise-units.md)

## Goal

Parse the date formats field workers actually type, and keep identifiers as text.

## Files

- `lib/core/normalise/dates.dart` (new)

## Steps

1. Parse common day-month-year forms with the project locale; never coerce an identifier to a number.

## Acceptance

- [ ] Leading zeros in asset numbers are preserved.

## Tests

- Unit tests including ambiguous dates and zero-prefixed identifiers.
