# 002 — Definition of ready and definition of done

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [001](001-how-to-use-this-plan.md)

## Goal

Fix the two quality gates every task passes through, so "done" means the same thing to everyone.

## Files

- `dev-plan/01-orchestration/_gates.md` (new)

## Steps

1. Ready: goal understood, dependencies merged, design tokens exist for anything visual, test approach known.
2. Done: code merged, analyzer clean, tests written and green, no TODO left, docs/spec updated when behaviour changed.
3. Add the non-negotiables: no raw data destroyed, no network call in a domain layer, no bespoke widget where a catalogue one exists.

## Acceptance

- [ ] Both checklists are short enough to be read before every task.
