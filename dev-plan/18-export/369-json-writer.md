# 369 — JSON writer

**Phase** 18 · Export  |  **Depends on** [358](358-value-formatter.md), [282](../13-processing/282-provenance-recording.md)

## Goal

Full-fidelity export: values raw, refined and final, provenance, confidence, evidence, context and templates.

## Files

- `lib/core/export/json_writer.dart` (new)

## Steps

1. Stream to file rather than building the whole document in memory.

## Acceptance

- [ ] A ten-thousand-record project exports without exhausting memory.

## Tests

- Schema validation test of the output.
