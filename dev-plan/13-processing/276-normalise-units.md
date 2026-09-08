# 276 — Normalise units and measures

**Phase** 13 · Processing pipeline  |  **Depends on** [150](../09-templates/150-field-type-registry.md)

## Goal

Turn "13 litre", "13L" and "13 Litre Capacity" into one stored value.

## Files

- `lib/core/normalise/units.dart` (new)

## Steps

1. Parse value plus unit, convert to the field's configured unit, keep the original text.

## Acceptance

- [ ] The original phrasing survives in the raw value.

## Tests

- Unit tests over the specification examples.
