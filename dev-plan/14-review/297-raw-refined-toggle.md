# 297 — Raw and refined toggle

**Phase** 14 · Review and approval  |  **Depends on** [283](../13-processing/283-caption-refinement.md), [294](294-review-screen.md)

## Goal

Show both versions and let the user choose which is authoritative.

## Files

- `lib/features/review/presentation/raw_refined_toggle.dart` (new)

## Steps

1. Per-field and per-caption toggle; the choice sets valueFinal and is remembered per project as a default.

## Acceptance

- [ ] Neither version is ever destroyed by the choice.

## Tests

- Widget test of both selections.
