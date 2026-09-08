# 469 — Backlog report generator

**Phase** 24 · Testing and release  |  **Depends on** [006](../01-orchestration/006-how-to-use-this-plan.md), [452](../23-hardening/452-field-trial.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the tool that turns everything unbuilt, every friction entry and every waived gate into one ordered backlog report.

## Files

- `tool/backlog_report.dart` (new)

## Contract

```dart
Future<int> main(List<String> args)  // writes build/backlog.md
```

## Steps

1. Scan the plan for unticked tasks, grouped by phase, with dependencies resolved to titles.
2. Merge in friction-log entries and waived release gates, each with its date and source.
3. Emit one ordered report naming, for every deferred item, the reason it was deferred and the trigger for revisiting it.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Running the tool after a release produces a backlog nobody has to assemble by hand.
- [ ] Tests written and passing: `test/tool/backlog_report_test.dart` runs over a fixture plan and asserts grouping and ordering.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
