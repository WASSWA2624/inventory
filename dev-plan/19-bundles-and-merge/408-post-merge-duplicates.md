# 408 — Post-merge duplicate scan

**Phase** 19 · Bundles and merge  |  **Depends on** [405](405-merge-apply.md), [318](../15-data-quality/318-duplicate-detection.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Catch records that are the same thing captured independently on two devices.

## Files

- `lib/features/merge/domain/post_merge_scan.dart` (new)

## Constraints

- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The scan runs automatically after every merge and lists pairs for review.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
