# 005 — Component reuse policy

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [004](004-architecture-rules.md)

## Goal

Make reuse the default: no screen builds its own button, field, dialog, empty state or spacing.

## Files

- `dev-plan/01-orchestration/_reuse.md` (new)

## Steps

1. Rule: if a widget is needed twice, it moves to the design system in the same pull request.
2. Rule: a feature may not hardcode a colour, radius, duration or padding; only tokens.
3. Rule: new catalogue widgets must be added to the widget gallery screen and given a golden test.

## Acceptance

- [ ] Every later UI task can cite this policy in its acceptance criteria.
