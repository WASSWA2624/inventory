# 012 — Canonical domain names

**Phase** 01 · Project setup and guardrails  |  **Depends on** [011](011-coding-standards.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the registry of canonical type names for every specification concept, and the test that stops synonyms appearing.

## Files

- `frontend/lib/core/naming/domain_names.dart` (new)
- `frontend/test/architecture/naming_test.dart` (new)

## Contract

```dart
abstract final class DomainNames { static const project = 'Project'; ... }
```

## Steps

1. Declare the canonical names: Project, TemplateDef, FieldDef, RecordEntry, FieldValue, CaptureSession, PhotoAsset, ContextState, ReferenceDataset, ProcessingJob, Bundle, MergeSession.
2. Write the test that scans lib/ for near-synonyms of each canonical name and fails, naming the correct term to use.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/13-workflow.md`.
- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Declaring a class named RecordModel or PhotoItem fails the test with the canonical name in the message.
- [ ] Tests written and passing: The naming test with fixtures for three synonyms.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
