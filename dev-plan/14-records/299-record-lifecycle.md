# 299 — Record status lifecycle

**Phase** 14 · Records  |  **Depends on** [298](298-record-model.md), [021](../01-orchestration/021-data-safety-rules.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Implement the one canonical status set and the legal transitions between them.

## Files

- `lib/features/records/domain/record_lifecycle.dart` (new)

## Steps

1. Statuses: DRAFT, CAPTURED, QUEUED, PROCESSING, EXTRACTED, NEEDS_REVIEW, APPROVED, FAILED, ARCHIVED, DELETED.
2. Export is a timestamp and an export membership, never a status.
3. Reject illegal transitions with a validation failure rather than silently allowing them.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Manual records go DRAFT to NEEDS_REVIEW to APPROVED without touching processing states.
- [ ] Tests written and passing: Unit tests over the full transition table.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
