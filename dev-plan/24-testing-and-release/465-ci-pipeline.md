# 465 — Continuous integration pipeline

**Phase** 24 · Testing and release  |  **Depends on** [003](../01-orchestration/003-strict-lints.md), [453](453-test-harness-unit.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Run format, analyze, unit, widget and golden tests on every push.

## Files

- `.github/workflows/ci.yml` (new)

## Steps

1. Cache dependencies; fail on analyzer warnings; upload golden failure images.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A red pipeline blocks merging.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
