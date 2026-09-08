# 379 — ZIP data package

**Phase** 18 · Export  |  **Depends on** [364](364-xlsx-writer.md), [371](371-csv-writer.md), [372](372-json-writer.md), [375](375-pdf-record-report.md), [005](../01-orchestration/005-dependency-allowlist.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Bundle the chosen outputs with photos, documents and a manifest.

## Files

- `lib/core/export/zip_package.dart` (new)

## Steps

1. Lay the archive out exactly as the specification shows; stream entries to avoid loading files into memory.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A four-hundred-megabyte package builds without exhausting memory.
- [ ] Tests written and passing: Test of archive layout and extraction.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
