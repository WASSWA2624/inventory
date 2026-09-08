# 443 — List and image performance

**Phase** 23 · Hardening  |  **Depends on** [300](../14-records/300-records-list.md), [121](../05-file-storage/121-thumbnail-cache.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Make long lists and photo grids smooth on a mid-range device.

## Files

- `frontend/lib/features/records/presentation/records_list_screen.dart` (edit)

## Steps

1. Virtualise, cache thumbnails, avoid rebuilding rows and cap concurrent decodes.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Scrolling ten thousand records holds a steady frame rate.
- [ ] Tests written and passing: Performance test recording frame times.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
