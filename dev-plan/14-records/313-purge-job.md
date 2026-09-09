# 313 — Retention purge job

**Phase** 14 · Records  |  **Depends on** [312](312-recycle-bin.md), [123](../05-file-storage/123-cache-cleanup.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Permanently remove tombstoned rows and their files after the retention window.

## Files

- `frontend/lib/features/records/domain/purge_job.dart` (new)

## Steps

1. Run on launch; purge only past the window; log counts; never purge unmerged tombstones.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A tombstone still needed by merge is never purged.
- [ ] Tests written and passing: Test that a recent deletion survives.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
