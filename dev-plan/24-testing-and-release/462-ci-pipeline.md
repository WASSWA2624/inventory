# 462 — Continuous integration pipeline

**Phase** 24 · Testing and release  |  **Depends on** [021](../02-foundation/021-strict-lints.md), [450](450-test-harness-unit.md)

## Goal

Run format, analyze, unit, widget and golden tests on every push.

## Files

- `.github/workflows/ci.yml` (new)

## Steps

1. Cache dependencies; fail on analyzer warnings; upload golden failure images.

## Acceptance

- [ ] A red pipeline blocks merging.
