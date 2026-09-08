# 246 — Identifier-first lookup

**Phase** 12 · Capture  |  **Depends on** [244](244-barcode-scanner.md), [197](../10-reference-data/197-lookup-prefill-apply.md), [097](../04-data-layer/097-records-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn a scanned or typed identifier into an existing record or a prefilled new one.

## Files

- `lib/features/capture/domain/identifier_lookup.dart` (new)

## Steps

1. Search existing records first, then reference datasets, then offer a new record with the identifier filled.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] All three outcomes from the specification are reachable in one tap each.
- [ ] Tests written and passing: Unit tests for match, reference match and no match.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
