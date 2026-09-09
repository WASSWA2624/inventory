# 517 — Integration tests in the pipeline

**Phase** 25 · Testing and release  |  **Depends on** [516](516-ci-pipeline.md), [506](506-test-harness-integration.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Run the integration suite on an emulator, nightly and before release.

## Files

- `.github/workflows/integration.yml` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/12-testing.md`, `frontend/.rules/13-workflow.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: A pipeline run proving the gate fails when any single step fails.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
