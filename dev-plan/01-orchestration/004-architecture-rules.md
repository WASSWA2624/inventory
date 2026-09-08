# 004 — Layering and dependency direction

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [003](003-coding-standards.md)

## Goal

Define the dependency arrows once: presentation -> domain <- data, and nothing points back.

## Files

- `dev-plan/01-orchestration/_architecture.md` (new)

## Steps

1. Repositories are interfaces in domain, implemented in data; presentation never touches a DAO.
2. All I/O (files, database, network, camera) sits behind an injectable service with a fake for tests.
3. Cross-feature reuse goes through core/, never by importing another feature's internals.

## Acceptance

- [ ] The rule set is enforceable by a lint or an import test added later in the plan.
