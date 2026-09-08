# 025 — Shared constants

**Phase** 02 · Foundation services  |  **Depends on** [004](../01-orchestration/004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the single file of durations, sizes, limits and storage keys so no magic number is repeated.

## Files

- `lib/core/constants/app_constants.dart` (new)

## Contract

```dart
abstract final class AppConstants { static const listPageSize = 50; static const imageLongEdge = 1600; ... }
```

## Steps

1. Define animation durations, debounce interval, list page size, image long edge and quality, retention days, confidence thresholds and secure-storage key names.
2. Group them into nested abstract final classes by area rather than one flat list.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No later task introduces a bare literal for any of these values.
- [ ] Tests written and passing: `test/core/app_constants_test.dart` asserts the values are within sane ranges.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
