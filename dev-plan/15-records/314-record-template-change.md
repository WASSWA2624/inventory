# 314 — Change a record's template

**Phase** 15 · Records  |  **Depends on** [311](311-record-detail.md), [166](../09-templates/166-template-versioning.md)

## Goal

Move a record to a different template, re-mapping by field key.

## Files

- `lib/features/records/presentation/record_template_change.dart` (new)

## Steps

1. Show what maps, what does not, and what will be retired, before applying.

## Acceptance

- [ ] Unmapped values are retained as retired, never dropped.
