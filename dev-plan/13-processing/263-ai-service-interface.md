# 263 — AI service interface

**Phase** 13 · Processing pipeline  |  **Depends on** [004](../01-orchestration/004-architecture-rules.md), [025](../02-foundation/025-result-and-failures.md)

## Goal

The one abstraction every provider implements, so providers are swappable.

## Files

- `lib/core/ai/ai_service.dart` (new)

## Steps

1. Declare readText, extractFields, refineText and transcribe with typed requests and results.
2. Include a null implementation that always returns unavailable, used when AI is disabled.

## Acceptance

- [ ] No feature imports a provider SDK directly.

## Tests

- Contract tests any implementation must pass.
