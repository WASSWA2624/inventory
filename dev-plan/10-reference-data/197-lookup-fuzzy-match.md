# 197 — Fuzzy matching

**Phase** 10 · Reference data  |  **Depends on** [196](196-lookup-exact-match.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Tolerate typos and abbreviations, with a confidence score and a threshold.

## Files

- `frontend/lib/features/reference/domain/fuzzy_matcher.dart` (new)

## Steps

1. Use a normalised edit distance plus token overlap; expose the score to the caller.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A near miss offers a suggestion rather than filling silently.
- [ ] Tests written and passing: Unit tests over a table of real-world name variants.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
