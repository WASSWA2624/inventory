# 495 — Container, compose and runbook

**Phase** 24 · The minimal backend  |  **Depends on** [493](493-be-contract-tests.md), [494](494-be-admin-commands.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the deployment artefacts and the operational runbook.

## Files

- `backend/Dockerfile` (new)
- `backend/docker-compose.yml` (new)
- `backend/RUNBOOK.md` (new)

## Steps

1. Single non-root container; twelve-factor configuration; migrations as an explicit step; graceful shutdown.
2. The runbook covers deploy, upgrade, rotate a key, change retention, investigate a failed purge and restore.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/10-deployment.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The runbook states plainly that server backups contain accounts and metadata, never projects.
- [ ] Tests written and passing: A smoke test that builds the image and runs the health check.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
