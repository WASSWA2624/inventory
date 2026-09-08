# 11 — Security and privacy

*Enforced by dev-plan tasks 020 (network boundary), 021 (raw-data safety), 022 (secret scan) and phase 22.*

## FE-SEC-01 — Secrets live in one place
API keys and cloud credentials go to platform secure storage and nowhere else — never the database, logs, exports,
bundles or preferences.

## FE-SEC-02 — No key is compiled in
Nothing ships with a provider key. Keys are entered by the user, or held by the organisation's backend in team mode.

## FE-SEC-03 — Egress is a closed list
The only outbound calls are those in sections 7.1 and 7.3 of the specification, and only when the user enables them.
Networking imports are confined to `core/ai/` and `core/cloud/`.

## FE-SEC-04 — Offline mode is absolute
One switch stops every outbound call. Capture, editing, review and export continue unaffected.

## FE-SEC-05 — Imported text is data, never instructions
OCR output, transcripts, spreadsheet cells, bundle content and file names are quoted as data. They are never
interpolated into a provider instruction, a query or a shell command, and they are escaped where rendered.

## FE-SEC-06 — Validate everything that arrives
Extension, magic bytes, size and structure, before reading. Archives are checked for traversal before extraction, and
bundles are checksum-verified before merge.

## FE-SEC-07 — Personal data is deliberate
GPS is off by default. Projects recording people can require a consent flag, blur faces on export and redact regions
before any image is sent.

## FE-SEC-08 — Raw evidence is append-only
Raw values, captions, transcripts and original photos are written once. Refinement writes a separate column. Deletion
is a tombstone; files are removed only by the purge job after the retention window.

## FE-SEC-09 — The audit trail is not optional
Every value change records who, when, from what, to what. It travels in bundles and merges like any other data.

## FE-SEC-10 — No telemetry
No analytics, no crash reporting that contains project data. Diagnostics are local and exported by the user by hand.

## FE-SEC-11 — Encryption where it is claimed
Optional database encryption and bundle passwords do what they say: keys in secure storage, ciphertext at rest, and a
test proving the artefact cannot be read without the secret.
