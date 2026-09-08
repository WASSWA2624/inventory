# 264 — Provider registry and selection

**Phase** 13 · Processing pipeline  |  **Depends on** [263](263-ai-service-interface.md), [132](../07-operator-and-settings/132-settings-store.md)

## Goal

Register the available implementations and choose one per project and per operation.

## Files

- `lib/core/ai/provider_registry.dart` (new)

## Acceptance

- [ ] Switching provider requires no change outside settings.
