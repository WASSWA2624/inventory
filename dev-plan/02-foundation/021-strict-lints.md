# 021 — Strict analyzer configuration

**Phase** 02 · Project foundation  |  **Depends on** [019](019-flutter-project-init.md)

## Goal

Turn the analyzer into the first reviewer.

## Files

- `analysis_options.yaml` (edit)

## Steps

1. Enable strict-casts, strict-raw-types and the recommended lint set, plus rules for const, sorted imports and unused code.
2. Fail the build on analyzer warnings, not just errors.

## Acceptance

- [ ] `flutter analyze` is clean and stays a required check.
