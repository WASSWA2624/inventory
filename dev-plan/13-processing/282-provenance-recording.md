# 282 — Record provenance

**Phase** 13 · Processing pipeline  |  **Depends on** [281](281-evidence-linking.md), [086](../04-data-layer/086-audit-table.md)

## Goal

Persist source, method, provider, model and prompt version per value.

## Files

- `lib/features/processing/domain/provenance.dart` (new)

## Acceptance

- [ ] An auditor can tell how any value came to exist.
