# 394 — Import as a new project

**Phase** 19 · Bundles and merge  |  **Depends on** [393](393-bundle-reader.md), [145](../08-projects/145-project-create.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Bring in a project this device has never seen.

## Files

- `frontend/lib/features/merge/domain/bundle_import_new.dart` (new)

## Steps

1. Recreate the folder tree, copy files, insert rows and preserve all identifiers.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The imported project is fully editable and exportable.
- [ ] Tests written and passing: Integration test importing an exported project.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
