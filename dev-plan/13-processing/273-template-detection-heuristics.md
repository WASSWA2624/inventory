# 273 — Template detection: local signals

**Phase** 13 · Processing pipeline  |  **Depends on** [178](../09-templates/178-template-detection-profile.md), [262](262-identifier-extraction.md)

## Goal

Score templates from OCR keywords, identifier patterns and reference matches, with no network.

## Files

- `lib/features/processing/domain/template_detection.dart` (new)

## Steps

1. Implement the selection order from the specification, stopping as soon as a rule decides.

## Acceptance

- [ ] A pinned template short-circuits detection entirely.

## Tests

- Unit tests over the full decision table.
