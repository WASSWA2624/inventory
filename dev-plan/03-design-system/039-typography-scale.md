# 039 — Typography scale

**Phase** 03 · Design system  |  **Depends on** [038](038-color-tokens.md)

## Goal

One type ramp with semantic names, sized for outdoor reading.

## Files

- `lib/app/theme/typography.dart` (new)

## Steps

1. Define display, title, section, body, bodyStrong, label, caption and mono roles with weights and line heights.
2. Verify each role at 200 percent text scale without clipping.

## Acceptance

- [ ] No widget constructs a TextStyle inline after this task.

## Tests

- Golden test of the ramp at default and doubled text scale.
