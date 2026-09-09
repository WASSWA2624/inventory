# 121 — Thumbnail cache

**Phase** 05 · File storage  |  **Depends on** [119](119-file-writer.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Generate and cache thumbnails so lists never decode full images.

## Files

- `frontend/lib/core/files/thumbnail_cache.dart` (new)

## Steps

1. Generate on first request in an isolate; store under .cache keyed by hash and size.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A tray of thirty photos scrolls without jank on a mid-range device.
- [ ] Tests written and passing: Test that a second request hits the cache.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
