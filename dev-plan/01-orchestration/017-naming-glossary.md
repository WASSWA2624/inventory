# 017 — Code names for spec concepts

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [003](003-coding-standards.md)

## Goal

Map every term in the specification to exactly one class or table name, killing synonyms before they spread.

## Files

- `dev-plan/01-orchestration/_glossary.md` (new)

## Steps

1. Fix names: Project, TemplateDef, FieldDef, RecordEntry, FieldValue, CaptureSession, PhotoAsset, ContextState, ReferenceDataset, ProcessingJob, Bundle, MergeSession.
2. Ban the words "item", "data", "info" and "manager" in type names.

## Acceptance

- [ ] Later tasks use these names verbatim, so search finds everything.
