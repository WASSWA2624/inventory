# 018 — Approved dependency list

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [003](003-coding-standards.md)

## Goal

Agree the package list and the rule for adding to it, so the tree stays small and auditable.

## Files

- `dev-plan/01-orchestration/_dependencies.md` (new)

## Steps

1. List the approved packages by purpose, with the version pinned and the reason recorded.
2. Rule: a new dependency needs a task of its own, a licence check and a note on what it replaces.

## Acceptance

- [ ] No task may add a package silently.

## Notes

- Verify the XLSX library against a real client workbook early; formatting fidelity decides the choice.
