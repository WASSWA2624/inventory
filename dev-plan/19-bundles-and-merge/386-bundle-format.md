# 386 — Bundle format and manifest model

**Phase** 19 · Bundles and merge  |  **Depends on** [357](../18-export/357-export-model.md), [110](../04-data-layer/110-sync-state-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Define the archive layout and the manifest exactly as specified.

## Files

- `frontend/lib/core/bundle/bundle_format.dart` (new)

## Steps

1. Declare the file list, the manifest schema, the format version and the lineage record.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The layout matches the specification file for file.
- [ ] Tests written and passing: Schema test of a written manifest.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
