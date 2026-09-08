# 277 — Normalise to choice options

**Phase** 13 · Processing pipeline  |  **Depends on** [276](276-normalise-units.md), [163](../09-templates/163-field-options-editor.md)

## Goal

Map free language onto the option list without discarding the detail.

## Files

- `lib/core/normalise/choices.dart` (new)

## Steps

1. Match on option label, code and alias; leave the descriptive sentence in its own field.

## Acceptance

- [ ] "Gauge damaged and requires repair" maps to Faulty while the sentence remains.

## Tests

- Unit tests over the specification examples.
