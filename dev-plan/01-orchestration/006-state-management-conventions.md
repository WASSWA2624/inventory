# 006 — Riverpod conventions

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [004](004-architecture-rules.md)

## Goal

One way to hold state, so controllers look identical across twenty features.

## Files

- `dev-plan/01-orchestration/_state.md` (new)

## Steps

1. Async data uses AsyncNotifier; ephemeral screen state uses Notifier; nothing uses setState beyond animation.
2. Providers are declared in the feature that owns them and exported through a single barrel per feature.
3. Side effects live in controllers; widgets only read state and call intent methods.

## Acceptance

- [ ] Naming, file location and disposal rules are written down with one worked example.
