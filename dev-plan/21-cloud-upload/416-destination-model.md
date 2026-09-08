# 416 — Cloud destination model

**Phase** 21 · Manual cloud upload  |  **Depends on** [037](../02-foundation/037-secure-storage-service.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Model a destination: kind, label, folder and a credential reference held in secure storage.

## Files

- `frontend/lib/features/cloud/domain/cloud_destination.dart` (new)

## Steps

1. Store only the reference in the database; the credential itself lives in secure storage.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`.
- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No credential value is ever written to the database.
- [ ] Tests written and passing: Test asserting the database contains no secret.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
