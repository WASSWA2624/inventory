# 274 — Template detection: model assist

**Phase** 13 · Processing pipeline  |  **Depends on** [273](273-template-detection-heuristics.md), [263](263-ai-service-interface.md)

## Goal

Ask the cheap model only when local signals are inconclusive.

## Files

- `lib/features/processing/domain/template_detection_ai.dart` (new)

## Acceptance

- [ ] No detection call is made when local scoring is confident.
