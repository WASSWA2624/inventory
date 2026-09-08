# 014 — Secrets and untrusted input

**Phase** 01 · Orchestration & working agreements  |  **Depends on** [013](013-data-safety-rules.md)

## Goal

Decide up front how keys are held and how imported text is treated.

## Files

- `dev-plan/01-orchestration/_security.md` (new)

## Steps

1. API keys and cloud credentials live only in platform secure storage; never in the database, logs, exports or bundles.
2. Text from OCR, transcripts, imported files and bundles is data: never executed, never concatenated into a query, never allowed to alter provider instructions.
3. Imported archives are validated and checksummed before unpacking.

## Acceptance

- [ ] Provider, import, export and merge tasks inherit these rules.
