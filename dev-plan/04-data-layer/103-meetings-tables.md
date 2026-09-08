# 103 — Meeting tables

**Phase** 04 · Local database  |  **Depends on** [093](093-records-table.md)

## Goal

Meeting header, attendees and action items.

## Files

- `lib/core/db/tables/meetings.dart` (new)

## Steps

1. Meetings: recordId, title, startAt, endAt, chair, secretary, agenda JSON, transcriptRaw, minutesRefined.
2. Attendees: name, title, organisation, contact, signaturePresent, matchedStaffId. Actions: action, ownerName, dueDate, status.
