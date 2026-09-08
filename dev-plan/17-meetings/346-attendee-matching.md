# 346 — Match attendees to staff data

**Phase** 17 · Meeting mode  |  **Depends on** [345](345-attendance-ocr.md), [190](../10-reference-data/190-lookup-fuzzy-match.md)

## Goal

Link extracted names to the Staff reference dataset where one exists.

## Files

- `lib/features/meetings/domain/attendee_matching.dart` (new)

## Steps

1. Offer a suggestion with a score; never link automatically below the threshold.
