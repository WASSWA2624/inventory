# 371 — CSV writer

**Phase** 18 · Export  |  **Depends on** [361](361-value-formatter.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One file per template, UTF-8 with a byte-order mark and a configurable delimiter.

## Files

- `lib/core/export/csv_writer.dart` (new)

## Steps

1. Quote correctly, escape newlines, and zip when more than one file is produced.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Test round-tripping through a CSV reader.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
