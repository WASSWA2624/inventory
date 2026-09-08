# 390 — Exclude secrets from bundles

**Phase** 19 · Bundles and merge  |  **Depends on** [387](387-bundle-writer.md), [022](../01-orchestration/022-security-policy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Guarantee no key, credential or device secret is ever written into a bundle.

## Files

- `frontend/lib/core/bundle/bundle_redaction.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An automated test scans every produced bundle for secret patterns.
- [ ] Tests written and passing: Test that fails if any secret-shaped string is present.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
