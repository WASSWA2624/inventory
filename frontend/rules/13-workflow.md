# 13 — Workflow

*Enforced by dev-plan tasks 006-009 (plan checker, scaffolder, verify command, git hooks).*

## FE-FLOW-01 — One task, one branch, one pull request
`task/<number>-<slug>`. Commit subjects start with the task number. A pull request that touches two tasks is split.

## FE-FLOW-02 — The gate is a command
`dart run tool/verify.dart` runs format, analyzer, dependency allowlist, structure, plan integrity, guardrails and
tests. It runs locally before review and identically in continuous integration.

## FE-FLOW-03 — Done means the checklist is ticked
Every box in the task's Definition of done, including the tests. A partially finished task stays open rather than
merging with a promise.

## FE-FLOW-04 — Never widen a task
Anything discovered mid-task becomes a new task file via `dart run tool/new_task.dart`. Scope creep is how a plan
stops being a plan.

## FE-FLOW-05 — Review cites rules
Feedback references a rule identifier or a specification section. Preference without a rule behind it is a suggestion,
not a blocker — and if it should be a rule, propose it as one.

## FE-FLOW-06 — Dependencies need a task
Adding a package requires its own task, an allowlist entry with a pinned version, a licence check and a note on what
it replaces.

## FE-FLOW-07 — Rules change deliberately
Editing this folder means editing the enforcing test in the same pull request, and saying in the commit body what
changed and why.

## FE-FLOW-08 — The plan is the backlog
New work becomes a numbered task file. Nothing lives only in a chat, an issue tracker or someone's memory.
