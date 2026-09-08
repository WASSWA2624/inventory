# 374 — PDF engine and shared layout

**Phase** 18 · Export  |  **Depends on** [005](../01-orchestration/005-dependency-allowlist.md), [043](../03-design-system/043-typography-scale.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One PDF foundation: cover page, header, footer, page numbers and photo blocks.

## Files

- `frontend/lib/core/export/pdf/pdf_engine.dart` (new)

## Steps

1. Reuse the type scale and spacing tokens so reports look like the app.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every report shares one visual language.
- [ ] Tests written and passing: Golden test of a rendered page.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
