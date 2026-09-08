# 431 — Treat imported text as data

**Phase** 22 · Privacy and security  |  **Depends on** [014](../01-orchestration/014-security-policy.md), [268](../13-processing/268-extraction-request.md)

## Goal

Ensure OCR, transcripts, imported files and bundle content can never act as instructions.

## Files

- `lib/core/security/untrusted_text.dart` (new)

## Steps

1. Pass such text only as delimited data in requests; never interpolate it into instructions.
2. Escape it wherever it is rendered, and never build a query by concatenation.

## Acceptance

- [ ] A crafted caption cannot change what the provider is asked to do.

## Tests

- Test with an injection-shaped fixture caption.
