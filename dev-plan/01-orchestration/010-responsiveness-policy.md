# 010 — Responsiveness and layout rules

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [005](005-reuse-policy.md)

## Goal

Define breakpoints and adaptive behaviour once so no screen invents its own layout logic.

## Files

- `dev-plan/01-orchestration/_responsive.md` (new)

## Steps

1. Breakpoints: compact under 600, medium 600-1023, expanded 1024 and above.
2. Navigation adapts: bottom bar on compact, rail on medium, rail plus persistent list pane on expanded.
3. Content is width-constrained with a readable maximum; lists become two-pane on expanded.
4. All spacing comes from tokens; nothing is positioned with fixed pixel offsets.

## Acceptance

- [ ] Every screen task can say "follows the responsive policy" instead of restating it.
