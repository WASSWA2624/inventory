# 316 — Field validators

**Phase** 15 · Data quality  |  **Depends on** [315](315-validation-engine.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The concrete rules: required, type, pattern, length, range, option membership, unit sanity — and the small
expression evaluator that `required_when` and the Computed field type both depend on (§12.1, §12.2). Task 164
lets a user type `fault_present == true`; nothing yet evaluates it, so conditional requiredness and computed
values do not work until this exists.

## Files

- `frontend/lib/core/validation/field_validators.dart` (new)
- `frontend/lib/core/validation/field_expression.dart` (new)

## Contract

```dart
sealed class FieldExpression { static Result<FieldExpression> parse(String src, List<TemplateField> fields); }
Object? evaluate(FieldExpression e, Map<String, Object?> values);
```

## Steps

1. Support comparison, equality, `and`/`or`/`not`, and arithmetic over other fields of the same template —
   `qty * unit_cost`, `fault_present == true`. No function calls, no field access outside the record.
2. Parse against the template's field list, so an expression naming a field that does not exist fails at edit
   time (164) rather than at capture time.
3. An expression that cannot be evaluated — a missing operand, a type mismatch — yields `null`, never a guess
   and never an exception: a Computed field with incomplete inputs is simply not yet computed (§34).
4. The evaluator is pure and takes no template, database or Flutter dependency, so 164, 252, 317 and 363 can all
   call it.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/07-consistency.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] `required_when` and Computed fields are evaluated through this one evaluator, never re-implemented.
- [ ] A malformed or unsatisfiable expression yields `null` and a typed failure, never an exception.
- [ ] Tests written and passing: Table-driven tests over valid and invalid values, plus expression tests
      covering parsing, evaluation, missing operands and type mismatches.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
