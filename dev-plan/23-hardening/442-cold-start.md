# 442 — Cold start optimisation

**Phase** 23 · Hardening  |  **Depends on** [023](../02-foundation/023-app-bootstrap.md)

## Goal

Reach the project list in under two seconds on a mid-range device.

## Files

- `lib/main.dart` (edit)

## Steps

1. Defer non-essential work, lazy-load providers, and avoid disk scans on the launch path.

## Tests

- Startup timing test.
