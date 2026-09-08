# 126 — First-run flow

**Phase** 06 · Application shell  |  **Depends on** [124](124-nav-shell.md), [033](../02-foundation/033-device-identity.md)

## Goal

The shortest possible path from install to first capture, with no account.

## Files

- `lib/features/onboarding/presentation/first_run_screen.dart` (new)

## Steps

1. Ask only for an operator name, then offer "Start a project" with a shipped template.
2. Skippable: a user can reach capture without answering anything.

## Acceptance

- [ ] A new install can capture within thirty seconds.

## Tests

- Widget test of the skip path.
