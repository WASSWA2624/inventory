# 335 — Prefill from the register

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [334](334-verification-mode.md), [192](../10-reference-data/192-lookup-prefill-apply.md)

## Goal

Fill the whole record from the reference row and mark it as on-record.

## Files

- `lib/features/quality/domain/verification_prefill.dart` (new)

## Steps

1. Keep the register values separately so differences can be computed later.

## Acceptance

- [ ] Not-found identifiers create a record flagged not-in-register.
