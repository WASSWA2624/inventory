# 425 — Disable AI per project

**Phase** 22 · Privacy and security  |  **Depends on** [145](../08-projects/145-project-settings.md), [264](../13-processing/264-provider-registry.md)

## Goal

Make a project fully manual with one switch.

## Files

- `lib/features/projects/presentation/ai_disable_switch.dart` (new)

## Acceptance

- [ ] With AI off, no processing screen offers an online action.

## Tests

- Integration test asserting no outbound calls for that project.
