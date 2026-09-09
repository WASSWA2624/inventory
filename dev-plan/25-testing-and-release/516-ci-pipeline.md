# 516 — Continuous integration pipeline

**Phase** 25 · Testing and release  |  **Depends on** [003](../01-orchestration/003-strict-lints.md), [504](504-test-harness-unit.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Run format, analyze, unit, widget and golden tests on every push, for the app. The backend has its own pipeline
(496); this one must fail when that one is red, because neither ships alone.

## Files

- `.github/workflows/ci.yml` (new)

## Steps

1. Cache dependencies; fail on analyzer warnings; upload golden failure images.
2. Require the backend workflow to be green on the same commit before this pipeline reports success.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/12-testing.md`, `frontend/rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A red pipeline blocks merging, and a red backend pipeline makes this one red.
- [ ] Tests written and passing: A pipeline run proving the gate fails when any single step fails.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
