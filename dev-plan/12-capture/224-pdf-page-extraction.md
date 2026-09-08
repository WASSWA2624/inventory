# 224 — Extract PDF pages as evidence

**Phase** 12 · Capture  |  **Depends on** [223](223-document-picker.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Render each page so OCR and review can treat pages like photos.

## Files

- `lib/core/import/pdf_pages.dart` (new)

## Steps

1. Render pages lazily at a readable resolution into .cache, keeping the source PDF intact.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A twenty-page document does not stall the interface.
- [ ] Tests written and passing: Test against a multi-page fixture.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
