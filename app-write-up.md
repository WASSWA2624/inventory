# AI Field Capture — Product & Technical Specification

**Document status:** Revision 2 — supersedes all earlier drafts.
**Architecture:** Local-first. The application runs entirely on the device; there is no application backend and no automatic cloud synchronisation.

---

## Table of Contents

**Part I — Product Definition**
1. Overview
2. Scope
3. Design Principles
4. Glossary
5. Primary Workflows
6. Representative Use Cases

**Part II — Data & Storage**
7. Local-Only Data Policy
8. On-Device Folder Layout
9. Database Overview
10. Identity, Versioning & Change Tracking

**Part III — Templates & Reference Data**
11. Template System
12. Field Definitions
13. Shipped Template Library
14. Multi-Template Projects & Automatic Template Detection
15. Predefined Rows (Checklists)
16. Reference Datasets & Prefill Lookups
17. Verification Mode (Known Records)
18. Template Versioning

**Part IV — Capture**
19. Capture Screen
20. Context Fields (Sticky Values)
21. Automatic Fields
22. Photos & Photo Editing
23. Captions & Caption Scope
24. Voice Input
25. Barcode / QR & Identifier-First Capture
26. Capture Now, Map Later
27. Rapid & Batch Capture
28. Meeting Mode

**Part V — AI Processing**
29. Processing Pipeline
30. AI Providers, Keys & Offline Behaviour
31. Structured Output & Validation
32. Raw vs Refined Storage
33. Confidence, Evidence & Provenance
34. The No-Invention Rule
35. Normalisation & Row Matching
36. Queue, Cost & Batching Control

**Part VI — Review & Data Quality**
37. Review Screen
38. Editing Saved Records
39. Validation Rules
40. Duplicate Detection & Override
41. Source Conflicts
42. Record Lifecycle & Status
43. History & Audit Trail

**Part VII — Collaboration**
44. Multi-Device Collaboration Model
45. Project Bundle Format
46. Bundle Export & Import
47. Merge Algorithm
48. Conflict Resolution

**Part VIII — Output & Distribution**
49. Export Formats
50. Excel Generation
51. Photo Naming & References
52. PDF Reports
53. Export History & Versioning
54. Manual Cloud Upload

**Part IX — Application Shell**
55. Navigation & Screens
56. Simplicity Rules
57. Settings
58. Accessibility & Field Usability
59. Performance
60. Security & Privacy

**Part X — Engineering**
61. Technology Stack
62. Project Structure
63. State Management
64. Key Packages
65. Testing Strategy
66. Delivery Plan
67. Definition of Done — MVP
68. Product Naming
69. Requirements Coverage Matrix

**Appendices**
A. Worked Example
B. Core Product Principle

---

# Part I — Product Definition

## 1. Overview

**AI Field Capture** is a Flutter application for collecting structured data about physical things — equipment, buildings, vehicles, stock, land, plants, animals, people, documents, meetings — using photographs, voice and typed input.

The application:

1. Captures evidence (photos, documents, audio, typed notes) offline.
2. Extracts structured information from that evidence using OCR, vision AI and speech-to-text.
3. Maps the extracted information into user-defined templates (spreadsheet-shaped or built in-app).
4. Requires a human to review and approve the result.
5. Exports the verified data as XLSX, CSV, JSON, PDF or a portable ZIP bundle.

Everything is stored on the device. Network access is used only for the online AI services the user chooses to enable, and for cloud uploads the user explicitly triggers.

## 2. Scope

### 2.1 In scope

- Fully offline capture, storage, editing, search and export.
- Multiple concurrent projects, each with one or more templates.
- Context values that persist across records (district, facility, department, and similar).
- Automatic date, time, sequence and operator stamping.
- Deferred processing: save raw evidence now, run AI later.
- Prefill of known records from imported reference data.
- Peer-to-peer collaboration by exchanging project bundles, with merge and conflict resolution.
- Meeting capture, including attendance photos and refined minutes.
- Manual, user-initiated upload of exports to a cloud storage account.

### 2.2 Out of scope

- No application server, no hosted database, no user accounts, no server-side roles.
- No automatic background upload of project data anywhere.
- No server-side backup. Backup is the user's ZIP export, kept wherever the user chooses.
- No model training on user data.

### 2.3 Consequences of having no backend

| Concern | Local-first answer |
|---|---|
| Authentication | None required. The app opens straight into work. An optional device lock (PIN / biometric) protects the app. |
| User identity | A local **operator profile** (name, optional initials/ID) used for attribution and merge. |
| Roles & permissions | Not enforced by software. Every operator on a device has full control of the projects on that device. |
| Multi-user work | Bundle export, transfer, import, merge (Part VII). |
| AI keys | Supplied by the user, held in platform secure storage on the device (§30, §60). |
| Backup | Manual ZIP export, optionally uploaded to the user's own cloud account (§54). |

## 3. Design Principles

1. **Local first.** The device is the system of record. The app is fully usable with the network permanently off.
2. **Extremely simple.** One obvious action per screen. A field worker completes a record in a handful of taps (§56).
3. **Evidence first.** Every value can be traced back to a photo, a document, a transcript or a person.
4. **Never invent.** Unknown is `null`, never a plausible guess (§34).
5. **Never lose the original.** Raw photos, raw captions and raw transcripts are preserved permanently and separately from AI-refined output (§32).
6. **Human approval is mandatory.** AI proposes; a person disposes.
7. **Type as little as possible.** Context values, automatic fields, lookups, barcodes and voice exist to eliminate keystrokes.
8. **Nothing blocks capture.** Poor network, slow AI or a missing template never stops a user from recording evidence.
9. **Template-driven.** The app has no built-in notion of "equipment" or "building". Behaviour comes from templates, so the app can inventory anything.
10. **Portable data.** Any project can leave the device whole and be reconstructed elsewhere.

## 4. Glossary

| Term | Meaning |
|---|---|
| **Project** | One data-collection exercise. Owns templates, records, files, reference data and exports. |
| **Template** | The definition of one record shape: its fields, types, validation, identity keys and output columns. |
| **Field** | One named, typed slot in a template (`field_key`, label, type, rules). |
| **Record** | One captured item: field values plus its evidence. |
| **Capture session** | The act of creating one record: photos, captions, voice and typed input, analysed together. |
| **Context** | Field values pinned by the user that auto-apply to subsequent records until changed (§20). |
| **Reference dataset** | An imported table used for prefill and lookup: suppliers, manufacturers, known assets, staff, locations (§16). |
| **Predefined row** | A pre-listed item the operator is expected to find, used as a checklist (§15). |
| **Raw value** | Exactly what was typed, spoken, scanned or read, unmodified. |
| **Refined value** | The AI-cleaned or normalised counterpart of a raw value, stored separately. |
| **Bundle** | A ZIP archive containing a complete project, portable between devices (§45). |
| **Operator** | The person using the device, identified by a local profile. |
| **Device ID** | A stable random identifier generated at first launch, used for merge. |

## 5. Primary Workflows

### 5.1 Immediate capture (network available)

```text
Open project
      |
Set / confirm context   (Kampala > Kasubi HC IV > Theatre)
      |
Capture photos + caption (typed or spoken)
      |
CAPTURE & ANALYSE
      |
AI: OCR -> vision -> template detection -> field extraction -> normalisation
      |
Review & edit
      |
Approve -> record saved
      |
(repeat) -> Export
```

### 5.2 Deferred capture (no network, or speed matters)

```text
Open project
      |
Set / confirm context
      |
Capture photos + caption -> SAVE RAW
      |
(repeat many times - nothing is analysed)
      |
Later, when convenient: Process queue -> Process all
      |
Review the processed records in a list
      |
Approve -> Export
```

### 5.3 Verification of an existing record

```text
Scan barcode / type asset or serial number
      |
Match found in reference data or existing records
      |
Record prefilled
      |
Confirm, edit, or photograph the differences
      |
Approve -> variance recorded (as-recorded vs as-found)
```

### 5.4 Collaboration

```text
Device A: Export bundle  ->  transfer (cable, SD card, share sheet, cloud)
                                       |
Device B: Import bundle -> merge preview -> resolve conflicts -> merged project
```

## 6. Representative Use Cases

| Use case | Notes |
|---|---|
| Medical equipment inventory across districts | Context: District › Facility › Department. Templates: Equipment, Building. |
| Building / facility condition assessment | Photo-heavy, condition scales, risk notes. |
| Verification audit of a known asset register | Reference dataset imported; verification mode; variance report. |
| Stock-taking and warehouse counting | Barcode-first capture, quantity fields, rapid mode. |
| Infrastructure and utility surveys | GPS enabled, map-ready export. |
| Document digitisation | PDF/scan input, OCR, field extraction. |
| Compliance and safety inspection | Predefined checklist rows, compliance and risk fields. |
| Meeting records | Meeting mode: minutes, attendance, actions (§28). |
| Biodiversity / agricultural surveys | Free-form templates: species, counts, condition, location. |
| Household or beneficiary registration | Person templates, consent flag, privacy controls (§60). |
| Dataset creation for downstream analytics | Stable field keys, data dictionary export, JSON/CSV output (§49). |

---
# Part II — Data & Storage

## 7. Local-Only Data Policy

All project data — database, photos, documents, audio, exports — lives in device storage. Nothing is transmitted automatically.

### 7.1 The only permitted outbound traffic

| Operation | Data sent | Trigger | Optional? |
|---|---|---|---|
| Cloud vision / extraction AI | Selected images (compressed copies) + captions + the field list of the template | User taps Analyse, or runs the processing queue | Yes — the app works without it |
| Cloud OCR (when on-device OCR is insufficient) | Selected images | Same | Yes |
| Cloud speech-to-text (when on-device STT is unavailable for the language) | Audio clip | User records voice | Yes |
| Text refinement (captions, minutes) | Raw text | User taps Refine, or automatic refinement is enabled | Yes |
| Manual cloud upload | The export file the user selected | User taps Upload (§54) | Yes |
| App/model metadata (versions, pricing lists) | None personal | Manual check for updates | Yes |

### 7.2 Guarantees

- No telemetry, analytics or crash reporting that includes project data.
- Offline mode (a single settings switch) blocks every outbound call; capture, editing and export continue to work.
- Each project can disable AI entirely, making it a pure manual-entry project.
- A per-project **Do not send images** switch forces on-device OCR only.
- The user is shown, before the first online call of a session, what will be sent (count of images and approximate size).

## 8. On-Device Folder Layout

Files are written to a single app-visible root folder so that the user can also reach them with a file manager or a USB cable.

```text
<Documents>/AIFieldCapture/
├── app.db                          # the local database (all projects)
├── app.db-wal / app.db-shm
│
├── projects/
│   └── 2026-medical-equipment-inventory__p7k2/
│       ├── photos/
│       │   ├── Kampala/
│       │   │   └── Kasubi-HC-IV/
│       │   │       ├── Theatre/
│       │   │       │   ├── AUTOCLAVE_SN458923_FRONT_01.jpg
│       │   │       │   ├── AUTOCLAVE_SN458923_RATING-PLATE_02.jpg
│       │   │       │   └── AUTOCLAVE_SN458923_FAULT_03.jpg
│       │   │       └── Laboratory/
│       │   └── _unfiled/                     # captured before a context was set
│       ├── documents/
│       ├── audio/                            # voice notes and meeting recordings
│       ├── meetings/
│       ├── reference/                        # imported lookup tables
│       ├── templates/                        # original template workbooks, unmodified
│       ├── exports/
│       │   ├── 2026-09-08_v1/
│       │   └── 2026-09-15_v2/
│       └── imports/                          # bundles received from other devices
│
├── shipped_templates/                        # read-only library included with the app
└── .cache/                                   # compressed upload copies, thumbnails, PDF page renders
```

### 8.1 Rules

1. **Original photos are never modified or deleted by the app.** Rotation, cropping and compression produce derived files in `.cache/`.
2. The photo subfolder path mirrors the **context hierarchy** in force when the photo was taken (§20). Folder names are sanitised (letters, digits, hyphen; length-capped).
3. Photos taken with no context go to `_unfiled/`; when a context is later applied to the record, the file is moved and the database path updated.
4. `.cache/` is disposable. Deleting it never loses data.
5. Folder strategy is configurable per project: **By context** (default), **By template**, **By capture date**, or **Flat**.
6. Every file row in the database stores a project-relative path, so moving the root folder or restoring a bundle never breaks references.
7. Storage headroom is checked before each capture session; below 500 MB the app warns, below 100 MB it blocks new capture and offers export/cleanup.

## 9. Database Overview

A single SQLite database (via Drift) holds every project. Binary files are on the filesystem; the database stores paths and hashes only.

### 9.1 Entities

```text
device_profile        one row: device_id, operator name, preferences
projects
templates             a template belongs to a project (or is a copy of a shipped template)
template_fields
template_rows         predefined checklist rows
context_definitions   the context hierarchy of a project (levels)
context_states        the currently pinned context values per project
records
record_fields         one row per field per record (raw + refined + provenance)
record_variances      as-recorded vs as-found differences (verification mode)
photos
documents
audio_clips
captions              record-level and photo-level, raw + refined
reference_datasets    imported lookup tables
reference_rows
meetings              meeting header (extends a record)
meeting_attendees
meeting_actions
processing_jobs       the deferred AI queue
processing_results    raw provider responses, kept for audit
field_evidence        links a value to the photo/document/transcript that produced it
duplicates            detected duplicate pairs and their resolution
merge_sessions        bundle imports
merge_conflicts       unresolved and resolved conflicts
exports               export history
audit_log             every change
tombstones            deletions, for merge
```

### 9.2 Core table shapes

```text
Project
  id                uuid
  name
  description
  organisation
  status            DRAFT | ACTIVE | PAUSED | COMPLETED | ARCHIVED
  start_date, end_date
  folder_name
  default_template_id
  settings_json     ai enabled, gps, folder strategy, refinement, thresholds
  created_at, updated_at, updated_by_device, rev

Template
  id                uuid
  project_id        (null for shipped library entries)
  name
  kind              GENERIC | EQUIPMENT | BUILDING | INSPECTION | MEETING | PERSON | STOCK | CUSTOM
  source            SHIPPED | XLSX_IMPORT | BUILT_IN_APP | DERIVED
  source_file_path  original workbook, preserved unmodified
  sheet_name
  header_row
  identity_fields   json list of field_keys used for duplicate detection
  detection_json    automatic-detection profile (§14)
  version
  created_at, updated_at, updated_by_device, rev

TemplateField
  id                uuid
  template_id
  field_key         stable machine key, e.g. serial_number
  label
  type              §12.1
  output_column     spreadsheet column letter or generated header
  required          REQUIRED | OPTIONAL | RECOMMENDED
  input_mode        ANY | MANUAL_ONLY | AI_ALLOWED | AUTO
  stickable         bool
  context_level     null, or 1..n when the field is a context level
  auto_fill         null | NOW | TODAY | TIME | SEQUENCE | OPERATOR | DEVICE | GPS | CONTEXT
  default_value
  options_json      choice list
  unit
  validation_json   pattern, min, max, length, custom message
  lookup_json       reference dataset binding (§16)
  refine            bool — store an AI-refined companion value
  sort_order

Record
  id                uuid
  project_id
  template_id
  template_row_id   null unless matched to a predefined row
  record_number     per-project sequence, displayed to the user
  status            §42
  processing_mode   IMMEDIATE | DEFERRED
  context_json      snapshot of the context in force at capture
  identity_hash     hash of identity field values, for duplicate detection
  source            CAPTURED | IMPORTED_TABLE | IMPORTED_BUNDLE
  captured_at, captured_by_operator, captured_on_device
  latitude, longitude, gps_accuracy       nullable
  approved_at, approved_by
  created_at, updated_at, updated_by_device, rev

RecordField
  id                uuid
  record_id
  field_key
  value_raw         exactly as captured/extracted
  value_refined     AI-cleaned/normalised counterpart, nullable
  value_final       the value the user approved (defaults to refined, else raw)
  confidence        0..1, nullable
  source            MANUAL | OCR | AI_VISION | AI_TEXT | STT | BARCODE | LOOKUP | CONTEXT | AUTO | IMPORT
  verified          bool
  verified_by, verified_at
  updated_at, updated_by_device, rev

Photo
  id                uuid
  record_id         nullable — photos may exist before a record is finalised
  capture_session_id
  original_filename
  stored_filename
  relative_path
  photo_type        FRONT | BACK | SERIAL | RATING_PLATE | DAMAGE | PANEL | LOCATION |
                    ATTENDANCE | DOCUMENT | OTHER
  caption_raw, caption_refined
  sort_order
  width, height, file_size, mime_type
  sha256            content hash — the merge identity of a photo
  captured_at
  latitude, longitude                      nullable
  created_at, updated_at, updated_by_device, rev
```

Documents, audio clips, meeting rows, reference rows, jobs and exports follow the same pattern: a UUID primary key plus `updated_at`, `updated_by_device` and `rev`.

## 10. Identity, Versioning & Change Tracking

Because projects merge between devices with no server to arbitrate, identity and change tracking are part of the data model, not an afterthought.

1. **UUIDv7 for every row**, generated on the device. Time-ordered, so lists sort naturally and two devices never collide.
2. **Device ID**: a random identifier created at first launch, stored in the device profile, never reused.
3. **Per-row revision counter** `rev`, incremented on every local change, plus `updated_at` (UTC) and `updated_by_device`.
4. **Per-field tracking**: `record_fields` rows carry their own `rev`/`updated_at`, so two operators editing different fields of the same record merge without conflict.
5. **Version vector per record**: `{device_id: max_rev_seen}`, used to distinguish "newer" from "concurrent" (§47).
6. **Content hashing**: photos, documents and audio are identified by SHA-256. The same file arriving twice is stored once.
7. **Tombstones**: deletions write a tombstone row (`entity_type`, `entity_id`, `deleted_at`, `device`) so a deletion propagates instead of being undone by the next merge.
8. **Timestamps are UTC** in storage and localised in the UI. Every record also stores the device's timezone offset at capture time.
9. **Human-facing numbers** (`record_number`) are per-project sequences for display only; they are never used as identity and are re-labelled on merge if they collide.

---
# Part III — Templates & Reference Data

## 11. Template System

A template defines one record shape. A project may contain several templates (equipment, building, meeting, and so on).

### 11.1 Four ways to obtain a template

| Route | Description |
|---|---|
| **Use a shipped template** | Pick from the library included with the app (§13). Usable immediately, no configuration. |
| **Derive from a shipped template** | Copy a shipped template, then add, remove, rename or reorder fields. The original library entry is read-only and unaffected. |
| **Import a spreadsheet** | Upload an existing `.xlsx` / `.csv`. The app reads sheets, header row, columns, existing rows and formatting, and proposes a field mapping. |
| **Build from scratch** | Add fields one at a time in the in-app template builder. No spreadsheet needed; output columns are generated from the labels. |

Any template can be duplicated, exported (as JSON or XLSX) and imported into another project or device.

### 11.2 Spreadsheet import

```text
Select workbook
      |
Detect sheets -> user picks the sheet (or "all sheets" -> one template each)
      |
Detect header row (first non-empty row of labels; user can correct it)
      |
Read columns, merged cells, data types, existing rows, formatting
      |
Suggest field_key, type and rules per column  (AI-assisted, editable)
      |
User confirms the mapping
      |
Template + field definitions stored; original workbook copied to templates/ unmodified
```

Suggested mapping is shown as a simple two-column list:

```text
Spreadsheet column        Field
-------------------------------------------
A  Asset ID           ->  asset_id          (Text, identity)
B  Equipment Name     ->  equipment_name    (Text, required)
C  Manufacturer/Brand ->  manufacturer      (Lookup: Suppliers)
D  Model              ->  model             (Text)
E  Serial Number      ->  serial_number     (Text, identity)
F  Location           ->  location          (Context level 3)
G  Condition          ->  condition         (Choice)
H  Purchase Year      ->  purchase_year     (Number)
I  Description        ->  description       (Long text, refine)
J  Photo              ->  photo             (Photo reference)
```

### 11.3 The internal schema is authoritative

Templates are stored as field keys, never as spreadsheet column letters. The column letter is one output attribute of a field.

```text
Wrong:   if (column == "B") ...
Right:   field_key == "equipment_name"  ->  output_column "B"
```

This keeps records valid when the template is edited, when the same data is exported to CSV/JSON/PDF, and when two devices merge templates with different column orders.

## 12. Field Definitions

### 12.1 Field types

| Type | Notes |
|---|---|
| Text | Single line |
| Long text | Multi-line; refinement typically enabled |
| Number / Decimal | Optional unit, min, max |
| Currency | Currency code per project |
| Percentage | |
| Date / Time / DateTime | Auto-fill supported (§21) |
| Boolean | Rendered as a switch |
| Choice | Single-select from an option list |
| Multi-choice | Multi-select |
| Lookup | Bound to a reference dataset; matching prefills other fields (§16) |
| Barcode | Populated by the scanner, typeable as fallback |
| Photo reference | Names/paths of the record's photos |
| Document reference | Attached files |
| GPS location | Latitude, longitude, accuracy |
| Signature | Drawn on screen, stored as an image |
| Computed | Read-only expression over other fields (for example `qty * unit_cost`) |

### 12.2 Field attributes

```text
required        REQUIRED | OPTIONAL | RECOMMENDED
input_mode      ANY         - typing, AI, lookup or context may fill it
                MANUAL_ONLY - AI may never write it (for example financial value)
                AI_ALLOWED  - AI may propose, human confirms
                AUTO        - filled by the system, read-only unless unlocked
stickable       may be pinned as context (§20)
context_level   1..n when this field is a level of the project context hierarchy
auto_fill       NOW | TODAY | TIME | SEQUENCE | OPERATOR | DEVICE | GPS | CONTEXT
refine          store an AI-refined companion value beside the raw one (§32)
identity        participates in duplicate detection (§40)
options         choice list, optionally with codes for export
validation      pattern, length, range, custom message
unit            displayed and exported (for example L, kg, V)
help            one short line of guidance shown under the field
```

### 12.3 Field editor

The in-app template builder is a plain list with drag-to-reorder. Adding a field asks three questions only — **Label**, **Type**, **Required?** — and every other attribute sits under **Advanced**.

## 13. Shipped Template Library

The app ships with ready-to-use templates. Each can be used as-is or copied and modified.

| Template | Representative fields |
|---|---|
| **Equipment / Asset** | Asset number, name, category, manufacturer, model, serial number, year, supplier, location, condition, functional status, fault, action required, estimated cost, photos |
| **Medical Equipment** | The above plus capacity, power rating, service provider, last service date, calibration due, risk class |
| **Building / Facility** | Building name, type, use, floors, construction year, roof, walls, floors, doors/windows, electrical, plumbing, sanitation, accessibility, overall condition, recommendations |
| **Room / Space** | Room name, function, area, occupancy, finishes, condition, defects |
| **Vehicle** | Registration, make, model, year, chassis, engine, mileage, insurance expiry, condition |
| **Furniture** | Item, material, quantity, condition, location |
| **ICT Equipment** | Type, make, model, serial, tag, specification, operating system, user, status |
| **Stock / Store Item** | Item code, description, unit, quantity counted, batch, expiry, storage condition |
| **Inspection / Compliance** | Item, requirement, observation, compliance, risk, recommendation, deadline, evidence |
| **Meeting** | §28 |
| **Person / Beneficiary** | Name, identifier, contact, role, category, consent, photo |
| **Land / Plot** | Plot number, tenure, area, use, boundaries, GPS |
| **Plant / Tree Survey** | Species, common name, count, height, health, GPS, photo |
| **Livestock / Animal** | Tag, species, breed, sex, age, health, owner |
| **Generic Item** | Name, category, identifier, description, condition, quantity, location, notes, photos |

**Generic Item** exists so that a user can begin capturing anything within seconds and refine the template afterwards.

## 14. Multi-Template Projects & Automatic Template Detection

A project may hold several templates. The app selects the right one per capture; the operator does not have to think about it.

### 14.1 Selection order

```text
1. Template pinned for this session (context bar)      -> use it, no detection
2. Only one template in the project                    -> use it
3. Barcode / identifier matches a reference dataset    -> use that dataset's template
4. Automatic detection (below)                         -> use it if confidence is high
5. Otherwise                                           -> ask the operator
```

### 14.2 Detection profile

Each template carries a `detection_json` profile:

```json
{
  "object_classes": ["autoclave", "microscope", "centrifuge", "medical device"],
  "keywords": ["serial", "model", "voltage", "rating plate"],
  "identifier_patterns": ["^AST-\\d{5}$", "^SN[0-9A-Z]{6,}$"],
  "reference_datasets": ["known_assets"],
  "negative_keywords": ["floor plan", "roof", "wall"],
  "weight": 1.0
}
```

Detection runs in the cheap first stage of the pipeline (§29) using on-device OCR text, any scanned identifier and a low-cost vision classification.

### 14.3 When detection is uncertain

If the top score is below the threshold (default 0.75), or the top two are within 0.1, the app asks with the smallest possible interruption:

```text
What is this?

[ Equipment ]   [ Building ]   [ Something else ]

[x] Use this template for the rest of this location
```

The checkbox pins the template to the current context level, so the question is asked once per room rather than once per item.

### 14.4 Structuring per template

Once a template is chosen, the record is structured entirely by that template: its fields, its validation, its identity keys, its output sheet and its export columns. Mixed-template projects export one sheet (XLSX) or one file (CSV/JSON) per template.

## 15. Predefined Rows (Checklists)

A template may carry a list of rows the operator is expected to find — an existing register, an equipment checklist, a room list.

```text
TemplateRow: id, template_id, output_row_number, identifier, label, aliases[], metadata, status
```

- The capture screen can show these as a checklist with progress: `Found 12 / 40`.
- On capture, the app matches the item to a predefined row (exact → alias → semantic → AI classification, §35) and populates that row.
- Rows never found can be exported as **Not found**, which is often the point of the exercise.
- The operator may add rows where the template permits it.

## 16. Reference Datasets & Prefill Lookups

Reference datasets remove repetitive typing and make already-known data reusable.

### 16.1 What a reference dataset is

An imported table (CSV, XLSX or JSON) with one key column and any number of attribute columns.

```text
Suppliers
  supplier_id | supplier_name | contact | phone | email | address | country

Manufacturers
  manufacturer_code | manufacturer_name | country | warranty_months | service_agent

Known Assets
  asset_number | serial_number | name | category | manufacturer | model |
  purchase_date | cost | department | custodian

Facilities
  facility_code | facility_name | district | level | ownership

Staff
  staff_id | name | title | department | phone
```

Datasets are imported per project or shared across projects, and can be edited in the app, added to during capture, and exported.

### 16.2 Lookup fields

A field of type **Lookup** is bound to a dataset:

```json
{
  "dataset": "suppliers",
  "match_on": ["supplier_id", "supplier_name"],
  "fuzzy": true,
  "fills": {
    "supplier_name":    "supplier_name",
    "supplier_contact": "contact",
    "supplier_phone":   "phone",
    "supplier_country": "country"
  },
  "on_no_match": "ALLOW_FREE_TEXT_AND_OFFER_ADD"
}
```

Behaviour:

1. The operator types, scans or speaks a value — or the AI extracts one.
2. The app matches on exact key, then case-insensitive name, then fuzzy name.
3. On a match, the mapped fields are filled, marked `source = LOOKUP`, and shown with a small link icon. They remain editable; editing one breaks the link for that field only and marks it `MANUAL`.
4. On multiple matches, a short picker appears.
5. On no match, the value is kept as free text with an **Add to Suppliers** action.

### 16.3 Prefilled templates

A template may declare dataset-driven defaults so that whole groups of fields never need re-entry:

```text
Template: Medical Equipment
  supplier      -> Lookup(Suppliers)      fills contact, phone, country
  manufacturer  -> Lookup(Manufacturers)  fills country, warranty, service agent
  facility      -> Lookup(Facilities)     fills district, level, ownership
```

Combined with context (§20), a typical equipment record needs only: photo, name, model, serial, condition.

## 17. Verification Mode (Known Records)

Used when the data already exists and the exercise is to confirm it.

### 17.1 Setup

The user imports the existing register as a reference dataset (or as records, §46.3) and switches the project or session to **Verification**.

### 17.2 Flow

```text
Scan barcode / type asset number, serial number or any configured identifier
      |
Look up: reference datasets first, then existing project records
      |
Found  -> the whole record is prefilled and shown as "On record"
Not found -> offer to create a new record (flagged NOT_IN_REGISTER)
      |
Operator confirms each field, edits by typing, or captures a photo and lets OCR/AI correct it
      |
Approve
```

### 17.3 Variance

Every field that differs from the register is recorded in `record_variances`:

```text
Asset AST-00123  -  Kasubi HC IV / Theatre

Field          On record          As found          Status
--------------------------------------------------------------
Location       Laboratory         Theatre           CHANGED
Condition      Good               Faulty            CHANGED
Serial         SN458923           SN458923          MATCH
Custodian      J. Okello          M. Nabbosa        CHANGED
```

Variance is exportable as its own sheet or report, and is the deliverable of a verification exercise. Records present in the register but never found are exported as **Missing**.

## 18. Template Versioning

- Editing a template creates a new version; existing records keep the version they were captured under.
- Records are migrated to a newer version only when the user asks; the app shows what will change (fields added, removed, retyped) before proceeding.
- Removed fields are hidden, not deleted: their values remain in the database and in JSON export, marked `retired`.
- Bundle merge treats templates like any other entity (§47); a template conflict is resolved by choosing a version or keeping both.

---
# Part IV — Capture

## 19. Capture Screen

One screen, one primary button.

```text
+--------------------------------------------------+
|  Medical Equipment Inventory            [ ... ]  |
|  Kampala  >  Kasubi HC IV  >  Theatre     [edit] |   <- context bar (§20)
|  Equipment  (pinned)                             |   <- template chip (§14)
+--------------------------------------------------+
|                                                  |
|   [ photo ] [ photo ] [ photo ]        + Add     |   <- photo tray (§22)
|                                                  |
|   Caption                              [ mic ]   |
|   "13 litre autoclave, pressure gauge faulty"    |
|                                                  |
|   Serial number            [ scan ] [ type ]     |   <- identity shortcut (§25)
|                                                  |
+--------------------------------------------------+
|         [  CAPTURE & ANALYSE  ]                  |
|         [  Save raw - analyse later  ]           |
+--------------------------------------------------+
```

- Opening the project goes straight here; the camera is one tap away.
- Nothing above is mandatory except at least one of: a photo, a caption, or a typed identifier.
- Both buttons save immediately to the device. They differ only in whether AI runs now (§26).
- After saving, the screen resets but **keeps the context, the pinned template and the capture settings**, ready for the next item.

## 20. Context Fields (Sticky Values)

The single most important input-saving feature. Values the operator sets once apply to every subsequent record until changed.

### 20.1 Hierarchy

Each project defines an ordered context hierarchy from its template fields (those with `context_level`). Example:

```text
Level 1  Region        Central
Level 2  District      Kampala
Level 3  Facility      Kasubi Health Centre IV
Level 4  Department    Theatre
Level 5  Room          Recovery Room 2
```

Any project can define its own levels — Site › Block › Floor, Farm › Field › Plot, Warehouse › Aisle › Shelf — or none at all.

### 20.2 Behaviour

1. Tapping a context chip opens a short picker: recent values, values from a reference dataset (for example Facilities), or free text.
2. A set value persists across records, screens, and app restarts, until changed or cleared.
3. Changing a higher level clears the levels beneath it, after a one-line confirmation: *"Change district to Wakiso? Facility and Department will be cleared."*
4. New records are prefilled from the context, marked `source = CONTEXT`, and remain individually editable. **Editing the value on one record does not change the project context** — a per-record override is exactly that.
5. The context snapshot is stored on each record (`context_json`), so changing the context later never alters existing records.
6. The context drives the photo folder path (§8) and can be included in generated file names (§51).

### 20.3 Non-hierarchical pinned fields

Any `stickable` field can be pinned without being a hierarchy level — surveyor name, funder, ownership, survey round, currency, condition rating scale. Pinned fields appear as chips beside the context and behave identically.

### 20.4 Context presets

A context set can be saved and re-selected in one tap:

```text
Saved locations
  Kasubi HC IV - Theatre          [ use ]
  Kasubi HC IV - Laboratory       [ use ]
  Mulago - Ward 4A                [ use ]
```

Useful when moving back and forth between two rooms, or resuming the next morning. Presets are per project and are included in exported bundles.

### 20.5 Auto-clear rules (optional, off by default)

- Clear the lowest context level after N minutes of inactivity.
- Prompt to confirm the context when the device has moved more than X metres (requires GPS).

Both are opt-in; the default is that context stays exactly where the operator left it.

## 21. Automatic Fields

Filled by the system without the operator touching them.

| Field | Source | Editable |
|---|---|---|
| Capture date | Device clock at first save | Yes, with an audit entry |
| Capture time | Device clock | Yes |
| Captured at (UTC + offset) | Device clock | No |
| Last modified | Device clock on each change | No |
| Record number | Per-project sequence | No |
| Operator | Device profile | Yes (choose another local profile) |
| Device | Device ID | No |
| App / template version | System | No |
| GPS latitude / longitude / accuracy | Device GPS, when enabled | Cleared, not edited |
| Context values | Context bar (§20) | Yes, per record |
| Photo count | Derived | No |

Rules:

- Any template field of type Date, Time or DateTime may set `auto_fill`; the default for a field the app recognises as a capture date is `TODAY`.
- Auto-filled values are shown greyed with a small clock icon, so the operator can see they were not typed.
- Dates are stored as ISO-8601 UTC with the device offset, and displayed and exported in the project's chosen format (default `dd MMM yyyy`).
- A survey date that differs from the capture date (backdated field work) is set once as a pinned field (§20.3) and applies to every record until changed.

## 22. Photos & Photo Editing

### 22.1 Capture

- Multiple photos per record, in any order.
- Sources: camera, gallery, file picker, PDF pages, scanned documents.
- The camera stays open for rapid multi-shot; each shot is written to disk immediately.
- Camera controls: flash, tap-to-focus, pinch zoom, grid, document mode with edge detection, barcode overlay.
- Quality warnings are advisory, never blocking (§39.3).

### 22.2 The photo tray

Each thumbnail shows its type badge and caption indicator. Tapping opens the viewer; long-press starts multi-select.

Available on one photo or on a selection:

```text
Preview        Retake         Delete
Reorder        Rotate         Crop
Set type       Add caption    Apply caption to selection (§23)
Move to another record         Duplicate to another record
```

### 22.3 Photo types

`FRONT · BACK · SERIAL · RATING_PLATE · DAMAGE · PANEL · LOCATION · ATTENDANCE · DOCUMENT · OTHER`

Types are suggested automatically after analysis and are used for file naming (§51) and evidence tracking (§33). The operator can set them manually at any time.

### 22.4 Editing after save

Photos can be added, removed, replaced, rotated, re-typed, re-captioned and reordered on a saved record at any time — including after approval, which returns the record to **Needs review** and records an audit entry (§38). Deleting a photo that supplied a field value flags the affected values as *evidence removed* rather than deleting the values.

## 23. Captions & Caption Scope

### 23.1 Two levels

| Level | Purpose |
|---|---|
| **Record caption** | Describes the item as a whole. The main context signal for extraction. |
| **Photo caption** | Describes one photo: "serial number plate", "cracked casing". |

Both can be typed or spoken, and both are stored **raw and refined** (§32).

### 23.2 Applying a caption to more than one photo

The caption sheet always shows an explicit target:

```text
Caption
+--------------------------------------------------+
| "Rating plate, model MED-1300"                   |
|                                       [ mic ]    |
+--------------------------------------------------+
Apply to:   ( ) This photo
            (o) Selected photos (3)
            ( ) All photos (7)

Mode:       (o) Replace     ( ) Append to existing

                       [ Apply ]
```

- **This photo** — default when opened from a single thumbnail.
- **Selected photos** — default when opened from multi-select; the count is always shown.
- **All photos** — applies to every photo in the current record, including ones added earlier in the session.
- **Append** preserves existing captions and adds the new text on a new line; **Replace** overwrites, and the previous caption is recoverable from history.

Applying a caption to many photos writes an independent caption row per photo, so each can afterwards be edited individually.

## 24. Voice Input

- The microphone is available on the record caption, every photo caption, every long-text field, and meeting mode.
- Speech-to-text runs on-device where the platform and language allow; otherwise it uses the configured online service, and is unavailable in offline mode with a clear message.
- **The transcript is preserved verbatim** as the raw value and is never overwritten by refinement (§32).
- Long recordings (meetings, walkthrough narration) are also saved as audio files under `audio/`, and can be re-transcribed later with a better service.
- Transcripts are evidence, not truth: any value derived from speech carries `source = STT` and is subject to the same review as AI output.
- Supported languages follow the device's speech services. English is the initial default; additional languages (Luganda, Swahili, Runyankole, Acholi, French, Arabic) are enabled as the platform or the chosen online service supports them.

## 25. Barcode / QR & Identifier-First Capture

Scanning is the fastest path to a correct record.

```text
Tap [scan]
      |
Read QR / barcode / asset tag
      |
Look up: existing records -> reference datasets
      |
+---------------------------------------------------------+
| Match found                                             |
|                                                         |
|  Existing record  -> open it, or add photos to it       |
|  Reference row    -> prefill a new record (§17)          |
|  No match         -> start a new record with the         |
|                      identifier already filled in        |
+---------------------------------------------------------+
```

- Supported symbologies: QR, Code 128, Code 39, EAN, UPC, Data Matrix, PDF417.
- Scanned values are `source = BARCODE` and carry full confidence.
- The scanner can stay open in **continuous mode** for stock counting: each scan increments a count or creates a stub record.

## 26. Capture Now, Map Later

Deferred processing is a first-class mode, not a fallback.

### 26.1 Saving raw

**Save raw — analyse later** stores photos, captions, transcripts, scanned identifiers, context and automatic fields, and sets the record to **Captured (unprocessed)**. No network is used and no AI runs. Capture continues immediately.

### 26.2 The processing queue

```text
Process                                     Online

  Unprocessed          38 records
  Queued                0
  Failed                2

  [ Process all ]   [ Process selected ]

  Kasubi HC IV / Theatre       12 records   >
  Kasubi HC IV / Laboratory     9 records   >
  Mulago / Ward 4A             17 records   >
  Failed                        2 records   >
```

- Processing is grouped by context so a user can process one facility at a time.
- Progress is per record, resumable, and safe to interrupt; a partly processed batch loses nothing.
- Failures are listed with a reason and a one-tap retry; the raw record is never harmed.
- **Auto-process when connected** is an opt-in setting, with an optional "Wi-Fi only" restriction.
- On-device OCR runs opportunistically on unprocessed records while charging, so text is ready before any online call is made.

### 26.3 Mixed projects

Immediate and deferred records coexist in a project. A record captured raw and processed a week later is indistinguishable in the final export, apart from its timestamps and audit trail.

## 27. Rapid & Batch Capture

For large surveys where speed dominates.

```text
RAPID MODE - Kasubi HC IV / Theatre

  Item 1   3 photos   "autoclave"          saved
  Item 2   2 photos   "microscope"         saved
  Item 3   4 photos   -                    saved
  Item 4   1 photo    "ECG machine"        saved

  [ New item ]                [ Process all (4) ]
```

- One tap ends an item and starts the next; the camera never closes.
- The context and pinned template carry across items.
- Nothing is analysed until **Process all**.
- Review then happens as a list, one record after another, with **Approve and next** as the primary action.

## 28. Meeting Mode

A meeting is a record built on a Meeting template, with extra structure.

### 28.1 Fields

```text
Title
Date, start time, end time            (automatic, editable)
Location                              (from context)
Chairperson, Secretary
Agenda items                          (list)
Attendees                             (list: name, title, organisation, contact, signature present)
Apologies
Discussion per agenda item            (raw notes + refined minutes)
Decisions                             (list)
Action items                          (action, owner, due date, status)
Next meeting date
Attachments                           (photos, documents, audio)
```

### 28.2 Inputs

| Input | Handling |
|---|---|
| Voice recording of the meeting | Saved to `audio/`, transcribed; the transcript is preserved verbatim |
| Typed notes | Preserved verbatim as the raw note |
| Photo of the attendance sheet | OCR to rows of `name / title / organisation / signature present`, each editable |
| Photos of participants, venue, whiteboards, handouts | Attached, captioned, classified `ATTENDANCE` or `DOCUMENT` |
| Documents (agenda, reports) | Attached as evidence |

### 28.3 Refinement

**Refine minutes** sends the raw notes and transcript to the text service and returns structured minutes: agenda items, discussion summaries, decisions and action items with owners and due dates.

- The raw transcript and raw notes are stored permanently and shown side by side with the refined minutes.
- Nothing is refined without the user asking, and the refined text is fully editable.
- Attendee names extracted by OCR are matched against the Staff reference dataset where available.
- Refusal rule: the refiner may not add attendees, decisions or actions that are absent from the raw material (§34).

### 28.4 Output

- **PDF** — formatted minutes with attendance list and photo appendix.
- **XLSX / CSV** — attendance sheet and action-item register.
- **JSON** — the complete structured meeting.

---
# Part V — AI Processing

## 29. Processing Pipeline

Processing is a background job on the device. It never blocks capture, and it can be cancelled and resumed.

```text
Raw record (photos, captions, transcript, identifiers, context)
      |
Stage 0  Local preparation                       [offline]
         resize / compress copies, orientation, deskew, contrast,
         document boundary detection, quality scoring, perceptual hash
      |
Stage 1  On-device extraction                    [offline]
         ML Kit OCR text + blocks
         barcode decoding
         identifier pattern matching
         reference-dataset lookup on any identifier found
      |
         --> If a reference match fills the record, the online stages
             may be skipped entirely (a large cost saving).
      |
Stage 2  Template detection (§14)                [offline heuristics, optional cheap model]
      |
Stage 3  Online extraction                       [online, optional]
         vision analysis of the image group
         field extraction against the template's field list
         caption / transcript refinement
      |
Stage 4  Normalisation (§35)                     [offline]
         units, choice mapping, date parsing, casing, row matching
      |
Stage 5  Validation (§39)                        [offline]
         types, patterns, ranges, required fields, duplicates
      |
Stage 6  Confidence, evidence and provenance (§33)
      |
      v
Record -> Needs review
```

Stages 0–2, 4 and 5 run with no network. Stage 3 is the only stage that requires connectivity, and a project may disable it permanently.

### 29.1 Group analysis

All photos of a record are analysed **together with** the record caption, the individual photo captions, the context values, the template field list and any matched predefined rows. Images are never analysed independently and merged blindly — one photo shows the item, another shows its serial plate, a third shows the fault.

### 29.2 Progress display

```text
Analysing 12 of 38

  done  Preparing images
  done  Reading text on device
  done  Identifying template
  busy  Extracting fields
  wait  Checking values
```

## 30. AI Providers, Keys & Offline Behaviour

### 30.1 Abstraction

All AI work sits behind one Dart interface, so providers can be swapped without touching the rest of the app:

```dart
abstract class AiService {
  Future<OcrResult>        readText(List<ImageRef> images);
  Future<ExtractionResult> extractFields(ExtractionRequest request);
  Future<String>           refineText(String raw, RefineStyle style);
  Future<String>           transcribe(AudioRef clip, String languageCode);
}
```

Implementations: on-device (ML Kit OCR, platform STT), and one implementation per online provider the user configures. Selection is per project, with a per-operation override.

### 30.2 Keys

- **No API key is compiled into the app.** Keys are entered by the user in Settings.
- Keys are stored in platform secure storage (Android Keystore / iOS Keychain via `flutter_secure_storage`), never in the database, never in logs, never in exports or bundles.
- Keys are shown masked after entry and can be tested with a one-call **Test connection** button.
- Per project, the user can select which configured provider to use, or none.

### 30.3 Behaviour without a network

| Capability | Offline |
|---|---|
| Capture photos, captions, typed values | Works |
| Speech-to-text | Works where the device supports the language offline; otherwise queued or unavailable |
| Text OCR | Works (on-device) |
| Barcode / QR | Works |
| Reference lookup and prefill | Works |
| Template detection | Works (heuristics) |
| Vision extraction and text refinement | Queued for later (§26) |
| Review, edit, approve | Works |
| Export XLSX / CSV / JSON / PDF / ZIP | Works |
| Cloud upload | Unavailable, queued as a pending user action |

## 31. Structured Output & Validation

The extraction request sends the template's field list; the response must be JSON matching a schema derived from that template.

Request (abridged):

```json
{
  "template": "Medical Equipment",
  "fields": [
    {"key": "equipment_name", "type": "text",   "required": true},
    {"key": "manufacturer",   "type": "lookup", "options_hint": ["ABC Medical", "XYZ Medical"]},
    {"key": "serial_number",  "type": "text",   "pattern": "^SN[0-9A-Z]{6,}$"},
    {"key": "condition",      "type": "choice", "options": ["Good","Fair","Poor","Faulty","Not Working","Missing","Unknown"]}
  ],
  "context": {"district": "Kampala", "facility": "Kasubi HC IV", "department": "Theatre"},
  "predefined_rows": ["Autoclave", "Microscope", "ECG Machine"],
  "caption": "13 litre autoclave, pressure gauge appears faulty",
  "ocr_text": "ABC MEDICAL  MED-1300  SN458923  13L  220V",
  "images": ["<image 1>", "<image 2>", "<image 3>"],
  "rules": [
    "Return only values supported by the supplied evidence.",
    "Use null when a value is not present. Never guess.",
    "Return valid JSON matching the schema."
  ]
}
```

Response:

```json
{
  "template": "Medical Equipment",
  "template_confidence": 0.97,
  "matched_row": "Autoclave",
  "fields": {
    "equipment_name": {"value": "Autoclave",    "confidence": 0.99, "evidence": ["image_1", "caption"]},
    "manufacturer":   {"value": "ABC Medical",  "confidence": 0.94, "evidence": ["image_2:ocr"]},
    "model":          {"value": "MED-1300",     "confidence": 0.91, "evidence": ["image_2:ocr"]},
    "serial_number":  {"value": "SN458923",     "confidence": 0.98, "evidence": ["image_2:ocr"]},
    "capacity":       {"value": "13 L",         "confidence": 0.96, "evidence": ["image_2:ocr", "caption"]},
    "condition":      {"value": "Faulty",       "confidence": 0.83, "evidence": ["image_3", "caption"]},
    "purchase_year":  {"value": null,           "confidence": 0.0,  "evidence": []}
  }
}
```

### 31.1 Enforcement

```text
Provider response
      |
Parse as JSON  -- fail --> repair attempt --> fail --> job FAILED, raw response stored
      |
Validate against the template-derived schema
      |
Drop unknown keys, coerce types, reject malformed values
      |
Apply to the record as proposals (never as approved values)
```

Raw provider responses are stored in `processing_results` for audit and for reprocessing without re-uploading.

## 32. Raw vs Refined Storage

**Every captured text keeps its original.** This is a hard rule of the data model.

| Stored as | Contents |
|---|---|
| `value_raw` / `caption_raw` | Exactly what was typed, spoken, scanned or read by OCR |
| `value_refined` / `caption_refined` | The AI-cleaned, corrected or normalised counterpart |
| `value_final` | What the user approved — defaults to refined when present, otherwise raw; editing sets it explicitly |

Rules:

1. Refinement never overwrites a raw value; it writes a separate column.
2. The review UI shows both, with a one-tap toggle between them and a **Use raw** / **Use refined** switch per field.
3. Refinement of an already-verified value never happens automatically.
4. Exports carry both where the template asks for it: a refined field exports as two columns, for example `Description` and `Description (AI refined)`. This is a per-project export option, on by default for refined fields.
5. Record captions, photo captions, meeting notes and voice transcripts all follow the same raw/refined pairing.

Example:

```text
Caption (raw, spoken)
"uh this is a thirteen litre autoclave in theatre the pressure gauge is broken I think"

Caption (AI refined)
"13 litre autoclave located in the theatre. Pressure gauge appears faulty."
```

Both are stored, both are exportable, and the operator decides which is authoritative.

## 33. Confidence, Evidence & Provenance

Every field value carries where it came from and how sure the system is.

```json
{
  "field": "serial_number",
  "value_raw": "SN458923",
  "value_final": "SN458923",
  "source": "OCR",
  "confidence": 0.98,
  "evidence": [{"type": "photo", "photo_id": "…", "region": [412, 233, 690, 271], "text": "SN458923"}],
  "verified": true,
  "verified_by": "W. Wasswa",
  "verified_at": "2026-09-08T09:14:22Z"
}
```

- **Sources**: `MANUAL · OCR · AI_VISION · AI_TEXT · STT · BARCODE · LOOKUP · CONTEXT · AUTO · IMPORT`.
- **Confidence bands** (configurable per project): `>= 0.90` high, `0.70–0.89` medium, `< 0.70` review required. Low confidence is highlighted, never hidden.
- **Evidence** links a value to the photo (with a highlight region where the provider supplies one), the document page, the transcript segment or the reference row that produced it. Tapping a value in review opens its evidence.
- Manual and barcode values have no confidence score; they are simply authoritative.
- Confidence is a processing aid. It never approves a record on its own.

## 34. The No-Invention Rule

If a value is not supported by the evidence, it is `null`.

```text
Purchase year
Not detected                    [ type it ]  [ photograph the label ]
```

- The extraction prompt states the rule explicitly, and post-validation drops values whose evidence list is empty for fields marked as evidence-required.
- Values contradicted by an identifier pattern or a choice list are rejected rather than coerced.
- Refinement may reword and correct obvious transcription errors; it may not add facts, attendees, decisions, measurements or dates that are absent from the raw text.

## 35. Normalisation & Row Matching

Normalisation runs on-device after extraction and is fully configurable per project.

### 35.1 Value normalisation

```text
"13 litre", "13L", "13 Litre Capacity"          ->  13 L
"not working", "doesn't work", "dead"           ->  Not Working
"abc medical ltd", "ABC MEDICAL"                ->  ABC Medical      (via reference dataset)
"08/09/26", "8 Sept 2026"                       ->  2026-09-08
"220v", "220 volts"                             ->  220 V
```

Free-text detail is preserved: mapping a description to the choice `Faulty` does not discard the sentence that produced it — the sentence stays in the description or fault field.

### 35.2 Row and item matching

```text
Exact identifier      ->  alias list       ->  normalised text match
      ->  fuzzy match  ->  AI classification (last resort, with confidence)
```

Aliases are editable per template:

```text
Blood Pressure Machine  <-  "BP machine", "blood pressure monitor", "sphygmomanometer"
```

### 35.3 Precedence when sources disagree

```text
1. Scanned barcode / QR
2. Value confirmed by a human
3. Reference dataset match on a scanned or typed identifier
4. OCR text from a clear label region
5. Vision analysis
6. Caption / transcript
7. Context and defaults
```

A value already marked verified is never overwritten by later processing. Reprocessing a verified record proposes changes; it does not apply them.

## 36. Queue, Cost & Batching Control

Field projects run to thousands of photographs, so processing is deliberately economical.

- **Skip the online call** when on-device extraction plus a reference match already fills every required field.
- **Two-stage processing**: a cheap first pass for classification, template detection and OCR; the capable model only for records that need it.
- **Group images per record** into a single request rather than one request per photo.
- **Deduplicate** by perceptual hash — the same photo is never analysed twice.
- **Cache** OCR and extraction results keyed by image hash plus template version.
- **Compress** upload copies (default long edge 1600 px, quality 80) while keeping originals untouched.
- **Batch window**: the queue processes N records at a time with retry and backoff, so a weak connection degrades gracefully.
- **Budget guard**: an optional per-project cap on records processed per day, with a running count of requests made.
- **Manual only** mode: nothing is ever sent unless the user taps Process.

---
# Part VI — Review & Data Quality

## 37. Review Screen

```text
+--------------------------------------------------+
|  Record 124        Autoclave        Needs review |
|  Kampala > Kasubi HC IV > Theatre                |
+--------------------------------------------------+
|  [photo] [photo] [photo]                  + Add  |
|                                                  |
|  Equipment name     Autoclave                99% |
|  Manufacturer       ABC Medical              94% |
|  Model              MED-1300                 91% |
|  Serial number      SN458923                 98% |
|  Capacity           13 L                     96% |
|  Condition          Faulty                   83% |  <- amber
|  Purchase year      Not detected                 |  <- grey
|  Location           Theatre               context|
|  Captured           08 Sep 2026 09:12        auto|
|                                                  |
|  Caption   [ raw | refined ]                     |
|  "13 litre autoclave located in the theatre.     |
|   Pressure gauge appears faulty."                |
+--------------------------------------------------+
|  [ APPROVE & NEXT ]        [ Re-analyse ]        |
+--------------------------------------------------+
```

- Fields needing attention are sorted to the top; confident ones are collapsed under **All fields** so the common case is a single glance and one tap.
- Tapping a value edits it; tapping the percentage opens its evidence (§33).
- **Approve & next** moves straight to the following unreviewed record, which makes batch review fast.
- **Re-analyse** re-runs processing without discarding verified values.

## 38. Editing Saved Records

Everything remains editable after saving, and after approval.

| Change | Effect |
|---|---|
| Edit a field value | Old value kept in history; `source` becomes `MANUAL`; field marked verified |
| Add photos | Appended; the record may be re-analysed if the user asks |
| Delete a photo | File retained until the record is deleted; affected values flagged *evidence removed* |
| Reorder / rotate / re-type photos | Recorded in history; original file untouched |
| Change the template | Field values are re-mapped by `field_key`; unmapped values are retained as retired fields and shown |
| Change context values | Applies to this record only; the folder path of its photos is updated |
| Re-run AI | Proposals shown as a diff; verified fields are never overwritten silently |
| Approve after editing | Status returns to Needs review first, then Approved; audit entry written |
| Delete a record | Soft delete with a tombstone; restorable from the Recycle bin for a configurable period (default 30 days) |

## 39. Validation Rules

### 39.1 Field validation

Types, patterns, ranges, lengths, option membership, required fields, unit sanity. Validation runs on save, and again before export.

```text
Serial number must match SN + 6 or more letters or digits
Condition must be one of: Good, Fair, Poor, Faulty, Not Working, Missing, Unknown
Purchase year must be between 1950 and 2026
Quantity must be a positive number
```

### 39.2 Record validation

- All `REQUIRED` fields present.
- Identity fields present when the template declares them.
- At least one photo, when the template requires evidence.
- No unresolved duplicate (§40) and no unresolved source conflict (§41).

### 39.3 Image quality (advisory)

Blur, darkness, overexposure, glare, small text, cropped subject. Warnings offer **Retake** or **Keep anyway**; they never block saving.

### 39.4 Export validation

Before an export runs, the app lists records that are incomplete or unapproved and offers: **Fix now**, **Exclude them**, or **Export anyway (marked incomplete)**.

## 40. Duplicate Detection & Override

### 40.1 Signals

```text
Identity fields (asset number, serial number, tag, plot number ...)
Identical photo hash
Near-identical photo (perceptual hash)
Same predefined row already captured in the same context
Same name + same context + close timestamp
```

### 40.2 When a duplicate is detected

Detection runs on save, on import of a table, and on bundle merge. The operator always decides:

```text
Possible duplicate

  Autoclave  -  SN458923  -  Kasubi HC IV / Theatre
  Existing record 087, captured 06 Sep 2026 by A. Nakato

  Field          Existing            New
  ---------------------------------------------------
  Condition      Good                Faulty
  Location       Laboratory          Theatre
  Photos         3                   4

  [ Override existing ]  [ Keep both ]  [ Discard new ]  [ Merge fields... ]
```

- **Override existing** replaces the existing record's values with the new ones after the operator has seen this comparison. Previous values are preserved in history and the action is audited. Overriding is only ever available after this human review — never automatic.
- **Merge fields** opens a per-field chooser (existing / new / keep both as a note).
- **Keep both** links the two records as `related_duplicate` so a later reviewer can see the pair.
- Photos from the discarded side can be attached to the surviving record.

### 40.3 Bulk duplicate review

A project-level **Duplicates** screen lists all pending pairs with the same four actions, and supports "apply the same choice to all remaining pairs in this group".

## 41. Source Conflicts

Different evidence for the same field:

```text
Serial number - sources disagree

  Photo 2, OCR        SN123456      98%
  Spoken caption      SN123465      —
  Reference dataset   SN123456      exact key match

  [ Use SN123456 ]   [ Use SN123465 ]   [ Type another ]
```

Conflicts are surfaced in review, must be resolved before approval, and the resolution is recorded with its reason.

## 42. Record Lifecycle & Status

One canonical status set. Export is a timestamp and an export membership, not a status, so a record's state is never ambiguous.

```text
DRAFT              being captured, not yet saved
CAPTURED           raw evidence saved, not processed        <- deferred mode rests here
QUEUED             waiting in the processing queue
PROCESSING         processing in progress
EXTRACTED          processing finished
NEEDS_REVIEW       has low-confidence, missing, duplicate or conflicting values
APPROVED           a human has verified and accepted it
FAILED             processing failed; raw evidence intact, retry available
ARCHIVED           excluded from active work and default exports
DELETED            tombstoned, recoverable until purged
```

```text
DRAFT -> CAPTURED -> QUEUED -> PROCESSING -> EXTRACTED -> NEEDS_REVIEW -> APPROVED
                                    |                          ^   |
                                    +--> FAILED --(retry)------+   +--> (edit) --> NEEDS_REVIEW
```

Manual-only records go `DRAFT -> NEEDS_REVIEW -> APPROVED`, skipping every processing state.

Flags carried alongside the status: `exported_at`, `has_duplicate`, `has_conflict`, `has_variance`, `not_in_register`, `merged_from_bundle`.

## 43. History & Audit Trail

Every change is recorded locally. There is no server to consult, so the device's log is the record.

```text
Record 124

  08 Sep 09:12   Captured by W. Wasswa (device A)   3 photos, context Theatre
  08 Sep 09:12   Auto-filled: capture date, operator, context
  08 Sep 10:40   Processed (provider X, model Y, prompt v3)
  08 Sep 10:41   Serial number  SN458923  (OCR, 98%)
  08 Sep 11:02   Serial number changed  SN458923 -> SN458928  by W. Wasswa
  08 Sep 11:03   Photo added: fault view
  08 Sep 11:04   Approved by W. Wasswa
  12 Sep 08:30   Merged from bundle "kasubi-teamB": condition Faulty -> Not Working (conflict resolved: theirs)
  12 Sep 09:00   Exported in export v2
```

Audit entries store: timestamp, operator, device, entity, action, field, previous value, new value, and reason where one was given. Audit rows travel inside bundles and merge like any other data, so the combined project retains the full history of every device that contributed to it.

---
# Part VII — Collaboration

## 44. Multi-Device Collaboration Model

Several people can work on one project without a server. Each device holds a complete, independent copy; copies are reconciled by exchanging bundles.

```text
Device A  ----export bundle---->  transfer  ---->  Device B  (import + merge)
Device B  ----export bundle---->  transfer  ---->  Device A  (import + merge)
Device C  ----export bundle---->  transfer  ---->  Device A  (import + merge)
```

Transfer is by any means the user prefers: share sheet, cable, SD card, Bluetooth, local Wi-Fi share, e-mail, or a cloud folder the user uploads to manually (§54).

Principles:

1. Merging is **additive and non-destructive**. No merge deletes data that has not been explicitly tombstoned.
2. Merging is **idempotent**. Importing the same bundle twice changes nothing the second time.
3. Merging is **order-independent** for non-conflicting changes.
4. Every automatic decision is visible; every ambiguous one is handed to a human.
5. A merge can be **undone** as a whole, from the merge history, until it is purged.

### 44.1 Practical patterns

| Pattern | How it works |
|---|---|
| Team lead consolidates | Members export at the end of each day; the lead imports each bundle into the master copy. |
| Split by area | Each member is assigned different context values (facilities, blocks); conflicts are then rare by construction. |
| Round-trip review | The lead merges, reviews and approves, then exports the merged bundle back to the team as the new baseline. |
| Device replacement | Export a bundle, import it on the new device; the project continues with full history. |

## 45. Project Bundle Format

A bundle is a plain ZIP archive with a documented layout, so it can also be opened and read by other tools.

```text
medical-equipment-inventory__deviceA__2026-09-08T1030.zip
│
├── manifest.json           bundle identity, versions, counts, checksums, lineage
├── project.json            project settings and context definitions
├── templates.json          templates, fields, predefined rows, aliases
├── reference/              reference datasets as CSV + a JSON descriptor
├── records.json            records, field values (raw + refined + final), provenance
├── captions.json           record and photo captions, raw + refined
├── meetings.json           meetings, attendees, actions
├── variances.json          verification differences
├── audit.json              audit log entries
├── tombstones.json         deletions
├── sync_state.json         version vectors per entity
├── photos/                 original files, in the project's folder structure
├── documents/
├── audio/
└── checksums.txt           SHA-256 of every file in the bundle
```

### 45.1 Manifest

```json
{
  "format": "aifc-bundle",
  "format_version": 1,
  "app_version": "1.4.0",
  "project_id": "0192f3c1-…",
  "project_name": "2026 Medical Equipment Inventory",
  "exported_at": "2026-09-08T10:30:00Z",
  "exported_by_device": "dev_A7F3",
  "exported_by_operator": "W. Wasswa",
  "scope": "FULL",
  "counts": {"records": 532, "photos": 1841, "documents": 12, "meetings": 3},
  "lineage": [
    {"device": "dev_A7F3", "max_rev": 5120},
    {"device": "dev_B21C", "max_rev": 3310, "merged_at": "2026-09-06T17:02:00Z"}
  ],
  "encrypted": false,
  "checksum": "sha256:…"
}
```

### 45.2 Options

- **Scope**: full project, a date range, a context subtree (one facility), only approved records, or data without photos (small bundle for review).
- **Compression** of photos in the bundle: originals (default) or reduced.
- **Password protection**: optional AES encryption of the archive, since bundles travel on removable media.
- Bundles never contain API keys, cloud credentials or device secrets.

## 46. Bundle Export & Import

### 46.1 Export

```text
Project > Share > Export project bundle
      |
Choose scope, photos, password
      |
Bundle written to projects/<project>/exports/  and offered to the share sheet
```

### 46.2 Import

```text
Import > choose .zip
      |
Read manifest, verify checksums, check format version
      |
Same project id?
   yes -> MERGE (§47)
   no  -> import as a NEW project (optionally: "merge into an existing project" with template mapping)
      |
Merge preview -> resolve conflicts -> apply
```

Photos are copied into the local project folder, deduplicated by SHA-256.

### 46.3 Importing plain tables

Existing spreadsheets can be imported either as a **reference dataset** (§16) or as **records**:

```text
Choose file (XLSX / CSV / JSON)
      |
Pick sheet and header row
      |
Map columns to template fields  (AI-suggested, editable)
      |
Choose: create records, or create a reference dataset
      |
Duplicate check against existing records (§40)
      |
Import summary: created, updated, skipped, conflicted
```

Imported records carry `source = IMPORTED_TABLE`, may be edited and photographed like any other record, and are the basis of verification exercises (§17).

## 47. Merge Algorithm

Merging runs per entity, then per field.

```text
For each incoming entity:

  unknown id                          -> INSERT
  tombstoned locally, incoming older  -> keep deletion
  tombstoned incoming, local older    -> apply deletion
  incoming vector dominates local     -> UPDATE (fast-forward)
  local vector dominates incoming     -> IGNORE
  concurrent                          -> FIELD-LEVEL MERGE
```

Field-level merge, for records:

```text
For each field:
  changed on one side only            -> take that change
  changed on both sides, same value   -> no conflict
  changed on both sides, different    -> CONFLICT unless a rule below settles it
```

Automatic settlement rules, applied in order:

1. A **verified** value beats an unverified one.
2. A **barcode or reference-matched** value beats an inferred one.
3. A **non-empty** value beats an empty one when the empty side never edited the field.
4. Otherwise → conflict for a human.

Other entity types:

| Entity | Rule |
|---|---|
| Photos, documents, audio | Union by SHA-256. Same content = one file. Captions merge per field. |
| Photo order | The importing device's order is kept; new photos are appended. |
| Templates | Same version → no action. Different versions → conflict, resolved by choosing one or keeping both (records keep their captured version, §18). |
| Reference datasets | Merge by key column; differing attribute values raise a conflict per row. |
| Predefined rows | Union by identifier. |
| Audit log, processing results | Append-only union, deduplicated by id. |
| Context presets | Union by name. |
| Record numbers | Re-labelled on collision; the UUID is unchanged, so no reference breaks. |

Duplicate detection (§40) runs after the structural merge, catching records that are *the same thing* while having different ids because two people captured the same item independently.

## 48. Conflict Resolution

### 48.1 Preview before anything is written

```text
Merge preview - kasubi-teamB.zip

  New records                 41
  Updated records             18
  New photos                 126
  Deletions to apply           2
  Conflicts                    7        <- must be resolved
  Possible duplicates          3        <- reviewed after merge

  [ Resolve conflicts ]   [ Cancel ]
```

### 48.2 Resolving one conflict

```text
Conflict 3 of 7        Record 124 - Autoclave (SN458923)

  Field: Condition

  This device        Faulty
  W. Wasswa, 08 Sep 11:04, verified

  Incoming           Not Working
  A. Nakato, 09 Sep 08:20, verified

  Evidence:  [ this device: 3 photos ]   [ incoming: 4 photos ]

  [ Keep mine ]   [ Take theirs ]   [ Type a value ]   [ Decide later ]

  [ ] Apply this choice to all remaining conflicts on this field
```

- Conflicts can be resolved one by one, in bulk by field, or in bulk by device ("prefer the field team's values").
- **Decide later** keeps both values; the record is flagged `has_conflict` and cannot be approved until settled.
- Every resolution writes an audit entry naming both candidates and the choice.
- The whole merge appears in **Merge history** with an **Undo merge** action that restores the pre-merge state.

---
# Part VIII — Output & Distribution

## 49. Export Formats

All five formats are first-class and available offline.

| Format | Contents | Typical use |
|---|---|---|
| **XLSX** | The template workbook populated with records; optional extra sheets: Raw vs Refined, Evidence, Photo index, Variance, Not found, Duplicates, Audit | The primary deliverable |
| **CSV** | One file per template/sheet, UTF-8 with BOM, configurable delimiter; zipped when there is more than one | Analysis, data warehouse loading |
| **JSON** | Full fidelity: records, raw and refined values, provenance, confidence, evidence links, context, templates, data dictionary | Programmatic consumption, data centres |
| **PDF** | Formatted report with photos, or meeting minutes, or a variance report | Sharing with people who do not use the app |
| **ZIP** | Either a data package (chosen formats + photos + manifest) or a full project bundle (§45) | Archiving, transfer, backup |

### 49.1 Export dialog

```text
Export

  Format      [x] XLSX  [ ] CSV  [ ] JSON  [ ] PDF
  Package     [x] Include photos    -> produces a ZIP

  Records     (o) Approved only  ( ) All  ( ) This context  ( ) Date range
  Columns     [x] Raw values  [x] AI-refined values  [ ] Confidence  [ ] Evidence
  Extras      [x] Photo index  [ ] Variance  [ ] Not found  [ ] Audit log

                       [ EXPORT ]
```

### 49.2 Data dictionary

Every JSON and XLSX export can include a **Data dictionary** sheet/section listing each field: key, label, type, unit, options with codes, required, and description. This makes an export self-describing for downstream analysts and data centres, independent of the app.

### 49.3 Data package layout

```text
MEDICAL_EQUIPMENT_2026-09-08_v2.zip
├── data.xlsx
├── data.csv
├── data.json
├── report.pdf
├── data_dictionary.csv
├── photos/
│   └── Kampala/Kasubi-HC-IV/Theatre/AUTOCLAVE_SN458923_FRONT_01.jpg
├── documents/
└── manifest.json
```

Manifest:

```json
{
  "project": "2026 Medical Equipment Inventory",
  "exported_at": "2026-09-08T08:30:00Z",
  "exported_by": "W. Wasswa",
  "record_count": 532,
  "records": [
    {
      "record_id": "0192f3c1-…",
      "record_number": 124,
      "output_row": 126,
      "template": "Medical Equipment",
      "context": {"district": "Kampala", "facility": "Kasubi HC IV", "department": "Theatre"},
      "photos": [
        "photos/Kampala/Kasubi-HC-IV/Theatre/AUTOCLAVE_SN458923_FRONT_01.jpg",
        "photos/Kampala/Kasubi-HC-IV/Theatre/AUTOCLAVE_SN458923_RATING-PLATE_02.jpg"
      ]
    }
  ]
}
```

## 50. Excel Generation

### 50.1 Rules

1. **The original template workbook is never modified.** Generation writes a new file into `exports/`.
2. When the template came from a spreadsheet, records are written into a copy of that workbook, preserving what the library can round-trip: sheet names, header rows, column widths, fonts, borders, cell styles, frozen panes and existing formulas.
3. Records map to rows by `field_key -> output_column`, appended after the last used row, or into the matched predefined row.
4. Raw and AI-refined values export as adjacent columns when the field has `refine` enabled and the option is on:

```text
| Description (raw)                              | Description (AI refined)                        |
| uh this is a thirteen litre autoclave in ...   | 13 litre autoclave located in the theatre. ...  |
```

5. Multi-template projects produce one sheet per template.
6. Long text is written as text, never coerced to a number or a date; identifiers keep leading zeros.
7. Formatting fidelity has practical limits in Dart spreadsheet libraries: charts, pivot tables, macros and some conditional formats may not survive a round trip. Where the library cannot guarantee preservation, the app writes a clean, well-formatted workbook and says so in the export summary rather than silently producing a damaged file.

### 50.2 Photo references in the spreadsheet

Three modes, selectable per project:

| Mode | Cell content |
|---|---|
| **Filename** (default) | `AUTOCLAVE_SN458923_FRONT_01.jpg` |
| **Relative path** | `photos/Kampala/Kasubi-HC-IV/Theatre/AUTOCLAVE_SN458923_FRONT_01.jpg` |
| **Embedded image** | The image itself, inserted and row-height adjusted (larger files, slower) |

A **Photo index** sheet always lists record number, photo type, caption and path, so photos are traceable even in filename mode.

## 51. Photo Naming & References

Files are named meaningfully at capture time and renamed once the record's identity is known.

```text
Pattern (configurable):
{IDENTIFIER}_{OBJECT}_{PHOTO_TYPE}_{SEQ}.{ext}

Examples:
AUTOCLAVE_SN458923_FRONT_01.jpg
AUTOCLAVE_SN458923_RATING-PLATE_02.jpg
AST-00123_MICROSCOPE_SERIAL_01.jpg
REC000124_GENERIC_OTHER_03.jpg          <- no identifier available yet
```

Rules:

- Available tokens: `{PROJECT}` `{RECORD_NO}` `{IDENTIFIER}` `{OBJECT}` `{PHOTO_TYPE}` `{SEQ}` `{DATE}` `{TIME}` `{OPERATOR}` and any context level such as `{FACILITY}`.
- Names are sanitised: uppercase, ASCII, hyphens for spaces, length-capped, duplicates suffixed.
- A photo taken before the identity is known uses the record number, and is renamed automatically once a serial or asset number is confirmed. The database keeps `original_filename` and every rename in history.
- The folder path supplies the context (§8), so file names stay short and readable.

## 52. PDF Reports

Generated on device, offline.

| Report | Contents |
|---|---|
| **Record report** | One record per page or per block: fields, photos, captions, context, operator, date |
| **Project summary** | Counts by context, template, condition and status, plus charts |
| **Variance report** | As-recorded vs as-found, plus items missing and items not in the register (§17) |
| **Meeting minutes** | Title, attendance, agenda, discussion, decisions, actions, photo appendix (§28) |
| **Inspection report** | Checklist items, observations, compliance, risk, recommendations, photo evidence |

Reports carry a cover page (project, date, operator, filters applied) and page numbers, and can embed thumbnails or full-size photos.

## 53. Export History & Versioning

- Every export is recorded: timestamp, operator, format, filters, record count, file path, file hash.
- Exports are versioned per project (`v1`, `v2`, …) and stored in dated folders. **Previous exports are never overwritten or deleted by the app.**
- Records included in an export get an `exported_at` stamp; the export history shows exactly which record versions a given file contains, so a file can always be explained after the fact.
- An export can be re-shared or re-uploaded later from the history list without regenerating it.

## 54. Manual Cloud Upload

Cloud storage is a destination for files the user chooses to send. It is never automatic and never a synchronisation channel.

### 54.1 Behaviour

```text
Export finished

  MEDICAL_EQUIPMENT_2026-09-08_v2.zip   (412 MB)

  [ Share ]   [ Upload to cloud ]   [ Done ]
```

Tapping **Upload to cloud** shows the configured destinations, the file size, and the destination folder, and asks for confirmation before any bytes leave the device.

### 54.2 Destinations

| Destination | Credentials supplied by the user |
|---|---|
| Google Drive | OAuth sign-in, or a service-account key file |
| Microsoft OneDrive | OAuth sign-in |
| Dropbox | OAuth sign-in |
| Amazon S3 or any S3-compatible store | Access key, secret, region, bucket, optional prefix |
| WebDAV / generic HTTPS endpoint | URL plus credentials |
| Local / SD card / USB folder | Path chosen with the system file picker |

### 54.3 Rules

1. Nothing uploads without an explicit tap, per file, every time.
2. Credentials are entered by the user and stored in platform secure storage; they never appear in the database, exports, bundles or logs.
3. Uploads are resumable and can be cancelled; a failed upload changes nothing locally.
4. Upload history records destination, file, size, timestamp and result.
5. Removing a destination deletes its stored credentials from the device.
6. Cloud storage is treated as a place to keep files, not as shared state: two devices coordinate through bundles (§44), not through a shared cloud folder.

---
# Part IX — Application Shell

## 55. Navigation & Screens

Four destinations. No login, no dashboard the user must pass through.

```text
[ Projects ]      [ CAPTURE ]      [ Records ]      [ More ]
```

| Screen | Purpose |
|---|---|
| **Projects** | List of projects with counts and last-worked timestamps. Create, open, import, export, archive. |
| **Capture** | The capture screen for the current project (§19). The centre button is visually dominant. |
| **Records** | Searchable, filterable list; opens a record for review or editing. |
| **More** | Templates, reference data, processing queue, duplicates, merge, exports, settings, help. |

Route map:

```text
/projects
/projects/new
/p/:projectId                     project home (counts, continue where you left off)
/p/:projectId/capture
/p/:projectId/records
/p/:projectId/records/:recordId
/p/:projectId/process              deferred queue
/p/:projectId/duplicates
/p/:projectId/templates
/p/:projectId/reference
/p/:projectId/export
/p/:projectId/merge
/settings
```

### 55.1 Project home

```text
2026 Medical Equipment Inventory

  Records           532        Needs review        43
  Unprocessed        38        Duplicates           3
  Photos          1,841        Last export    07 Sep

  Kampala > Kasubi HC IV > Theatre                 [change]

  [  CONTINUE CAPTURING  ]

  Review 43   ·   Process 38   ·   Export   ·   Share
```

### 55.2 Records list

```text
Search: SN4589                        [ filters ]

  124  Autoclave        SN458923   Theatre      Approved
  121  Microscope       SN783421   Laboratory   Needs review
  118  ECG Machine      —          Ward 4A      Unprocessed
```

Filters: context, template, status, date, operator, condition, has photos, has duplicate, has conflict, not in register. Sorting by number, date or name. Search covers field values, captions, transcripts and OCR text.

## 56. Simplicity Rules

Concrete, testable rules that keep the interface extremely simple.

1. **One primary action per screen**, rendered as the largest control.
2. **Four navigation destinations**, never more.
3. **A record can be created in three taps**: Capture → shutter → Save.
4. **No mandatory setup.** A new user can capture within 30 seconds of installing, using a shipped template and the Generic Item fallback.
5. **No login, no account, no onboarding tour.**
6. **Everything advanced is behind "Advanced"** or in More; the default screens show only what a field worker needs.
7. **Defaults are always sensible**: today's date, the current context, the last template, the last camera settings.
8. **No dialog chains.** At most one decision at a time, and every decision has a safe default.
9. **Nothing blocks work.** Warnings offer "Keep anyway"; errors never discard input.
10. **Plain language.** "Not detected", not `null`. "Analyse", not "invoke extraction pipeline".
11. **Touch targets at least 48 dp**, primary actions reachable with one thumb.
12. **Undo** for destructive actions, and a recycle bin for deletions.
13. **The status of the app is always visible in one line**: context, template, online/offline, unprocessed count.

## 57. Settings

```text
Operator
  Name, initials, contact                        (local only)

Capture
  Default camera mode, flash, grid
  Auto-fill dates and times                      on
  GPS capture                                    off
  Photo quality / compression
  Folder strategy                                By context
  File naming pattern

AI
  Provider and API key                           (secure storage)
  Use AI                                         on / off per project
  Do not send images                             off
  Auto-process when connected                    off
  Wi-Fi only                                     on
  Refine captions automatically                  off
  Confidence thresholds

Language
  App language
  Voice language

Storage
  Storage used, by project
  Clear cache
  Recycle bin retention                          30 days

Data
  Export project bundle
  Import bundle or spreadsheet
  Cloud destinations
  Merge history

Security
  App lock (PIN / biometric)                     off
  Encrypt exports by default                     off

About
  Version, licences, help
```

## 58. Accessibility & Field Usability

- Large text support and a high-contrast theme for direct sunlight.
- Screen-reader labels on every control; the capture flow is fully operable by voice and switch access.
- Large camera controls usable with gloves; haptic confirmation on capture and save.
- Works one-handed: primary actions in the lower third of the screen.
- Colour is never the only signal — icons and text accompany every status colour.
- Tolerates interruption: an incoming call or a locked screen never loses an in-progress capture.

## 59. Performance

Targets on a mid-range Android device:

| Action | Target |
|---|---|
| Cold start to Projects | < 2 s |
| Project open to Capture | < 1 s |
| Shutter to photo saved and ready for the next shot | < 400 ms |
| Records list, 10,000 records | smooth scrolling, paged loading |
| Search across 10,000 records | < 300 ms (indexed) |
| XLSX export, 5,000 records | < 30 s, on a background isolate with progress |

Techniques: paged queries and indexes on project, status, context, identity hash and timestamps; thumbnails generated once and cached; full images loaded only in the viewer; image compression, hashing, export generation and merge run on background isolates; the UI thread never performs file or database work.

## 60. Security & Privacy

### 60.1 On the device

- Optional app lock with PIN or biometrics.
- API keys and cloud credentials in platform secure storage only.
- The database and files live in app-private storage; an optional setting encrypts the database (SQLCipher) and export archives.
- Deleted records are tombstoned and purged after the retention period, including their files.

### 60.2 Data leaving the device

- Only the operations listed in §7.1, only when the user enables them.
- A one-screen summary before the first online call of a session states what will be sent.
- Bundles and exports never contain credentials or device secrets.

### 60.3 Personal data

- Photographs may contain people, documents and identifiers. Projects that collect personal data can enable: a consent flag per record, face blurring on export, and redaction of marked regions before any image is sent for analysis.
- GPS is off by default and can be enabled per project.
- The operator's name is stored locally for attribution and travels in bundles shared with teammates; nothing else identifies the user.

### 60.4 Input safety

- Imported files (spreadsheets, bundles, images) are validated by extension, MIME sniffing, size and structure before being read; a malformed archive is rejected without being unpacked.
- Bundle checksums are verified before merge.
- Text arriving from OCR, transcripts, imported files or bundles is treated strictly as data. It is never executed, never used to build queries by concatenation, and never allowed to alter the app's instructions to an AI provider.

---
# Part X — Engineering

## 61. Technology Stack

```text
Flutter (Android first; iOS, Windows and Web later)
Dart
Riverpod            state management
GoRouter            navigation
Material 3          theming
Drift + SQLite      local database
Isolates            image processing, export generation, merge
```

There is no server component, no ORM on a backend, and no hosted database. AI providers are reached directly over HTTPS from the device using the user's own key.

Platform portability: nothing in the design depends on Android-only APIs beyond the standard camera, storage, speech and secure-storage plugins, so iOS and desktop targets remain reachable.

## 62. Project Structure

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
├── core/
│   ├── db/               drift database, daos, migrations
│   ├── files/            folder layout, naming, hashing, cache
│   ├── ai/               AiService interface + implementations
│   ├── export/           xlsx, csv, json, pdf, zip writers
│   ├── import/           spreadsheet reader, bundle reader
│   ├── merge/            version vectors, merge engine, conflict model
│   ├── validation/       field, record and export validation
│   ├── normalise/        units, choices, dates, aliases
│   ├── security/         secure storage, app lock, redaction
│   ├── errors/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── projects/
│   ├── templates/        builder, spreadsheet mapping, shipped library
│   ├── reference/        datasets and lookups
│   ├── context/          context bar, presets
│   ├── capture/
│   │   ├── camera/
│   │   ├── gallery/
│   │   ├── documents/
│   │   ├── voice/
│   │   ├── barcode/
│   │   └── rapid/
│   ├── processing/       queue, jobs, progress
│   ├── review/
│   ├── records/
│   ├── duplicates/
│   ├── meetings/
│   ├── exports/
│   ├── cloud/
│   ├── merge/
│   └── settings/
└── shared/
```

Each feature uses `data/ · domain/ · presentation/`:

```text
capture/
├── data/          capture_repository_impl.dart, local data sources
├── domain/        capture.dart, capture_repository.dart, capture_service.dart
└── presentation/  capture_screen.dart, capture_controller.dart, widgets/
```

## 63. State Management

```text
deviceProfileProvider        operator, device id
projectsProvider             list, create, archive
currentProjectProvider
templatesProvider            per project
contextProvider              pinned context values and presets      <- §20
captureProvider              in-progress capture session
photoTrayProvider
processingQueueProvider      deferred jobs and progress             <- §26
recordsProvider              paged, filtered
recordProvider(recordId)
duplicatesProvider
mergeProvider                preview, conflicts, apply, undo
exportProvider
connectivityProvider         online / offline / metered
aiConfigProvider             providers, keys, per-project switches
```

The context provider is persisted, so a restart resumes exactly where the operator was.

## 64. Key Packages

```text
camera / image_picker / file_picker          capture and selection
image                                        resize, rotate, quality checks
google_mlkit_text_recognition                on-device OCR
mobile_scanner                               barcode / QR
speech_to_text                               on-device speech
record + just_audio                          meeting audio
drift + sqlite3_flutter_libs                 database (sqlcipher_flutter_libs when encryption is on)
path_provider                                storage roots
crypto                                       SHA-256
uuid                                         UUIDv7 identifiers
archive                                      ZIP bundles
excel / syncfusion_flutter_xlsio             XLSX read and write
csv                                          CSV read and write
pdf + printing                               PDF generation
flutter_secure_storage                       keys and credentials
geolocator                                   optional GPS
connectivity_plus                            network state
share_plus                                   share sheet
googleapis + google_sign_in / minio          cloud destinations
flutter_local_notifications                  processing and export notifications
```

Library choice for XLSX must be validated early against a real client template; see §50.1 rule 7.

## 65. Testing Strategy

| Level | Coverage |
|---|---|
| **Unit** | Field validation, normalisation, alias and row matching, identity hashing, file naming, folder pathing, context inheritance and clearing, auto-fill, merge algorithm and version vectors, duplicate detection, spreadsheet schema parsing, export writers |
| **Widget** | Capture screen, context bar, photo tray and caption scope, review screen, conflict resolution, template builder |
| **Integration** | Camera to saved record; deferred queue to processed record; import spreadsheet to records; export to XLSX/CSV/JSON/PDF/ZIP; bundle export to import on a second database |
| **End-to-end** | Create project → shipped template → set context → capture 3 records offline → process → review → approve → export ZIP → import on a second device → merge with conflicts → resolve → export again |

Critical test cases:

```text
1  Single photo                   fields extracted, record created
2  Multiple photos                information combined, not overwritten
3  Missing information            value is null, nothing invented
4  Context inheritance            5 records inherit context; editing one does not change the others
5  Context change                 changing district clears facility and department
6  Auto dates                     date and time filled without input, editable, audited
7  Caption to all photos          7 photos each receive an independent caption row
8  Deferred capture               40 records captured offline, processed later, none lost
9  Duplicate serial               warning shown; override applies only after review
10 Known-asset prefill            scan fills the record; variance recorded for differences
11 Template detection             building photos choose the Building template
12 Meeting mode                   transcript preserved, minutes refined, attendance OCR'd
13 Raw vs refined                 both stored, both exportable, raw never overwritten
14 Bundle round trip              export, import, merge, conflict resolved, undo works
15 Photo dedupe on merge          identical photo imported twice is stored once
16 AI failure                     raw record intact, retry available
17 Offline export                 XLSX, CSV, JSON, PDF and ZIP all generated with no network
18 Storage full                   graceful warning, no corrupted record
```

## 66. Delivery Plan

### Phase 1 — Vertical slice (build this first)

```text
Create project -> pick a shipped template -> set context -> capture photos + caption
   -> save raw -> process (on-device OCR + one online extraction) -> review -> approve
   -> export XLSX + photos
```

Everything else is built around this once it works reliably end to end.

### Phase 2 — Field-ready

```text
Deferred processing queue and batch review
Rapid capture mode
Reference datasets, lookups and prefill
Barcode / QR and identifier-first capture
Verification mode and variance
Duplicate detection and override
Spreadsheet import (templates and records)
CSV / JSON / PDF export, ZIP packaging
Editing saved records, history and audit trail
```

### Phase 3 — Teams and breadth

```text
Project bundles: export, import, merge, conflict resolution, undo
Meeting mode
Multi-template projects and automatic template detection
In-app template builder and the full shipped library
Manual cloud upload destinations
Documents and PDF input
GPS and map view
```

### Phase 4 — Advanced

```text
Automatic photo classification and real-time on-camera recognition
Face blurring and document redaction
Risk and condition scoring suggestions
Local analytics: correction rates, accuracy by field, progress by context
Additional voice languages
Desktop build for consolidation and reporting
```

## 67. Definition of Done — MVP

A user can, on one device with no account and no server:

- Create a project and choose or import a template.
- Set a context hierarchy and have it persist across records.
- Capture multiple photos, type or speak a caption, and apply a caption to one, several or all photos.
- Have dates, times, operator and record number filled automatically.
- Save raw and process later, or analyse immediately.
- Have text extracted on device and fields extracted online, with nothing invented.
- See raw and AI-refined values side by side, and choose between them.
- Review, correct and approve records, and edit them afterwards, including adding and removing photos.
- Be warned about duplicates and override an existing record after reviewing the differences.
- Scan or type an identifier and have a known record prefilled from imported reference data.
- Export XLSX, CSV, JSON, PDF and a ZIP package, with photos in an organised folder tree.
- Export a project bundle, import it on another device, and merge it with conflict resolution.
- Upload an export to a cloud destination by explicit action.
- Do all of the above offline, except the online AI steps and the upload.

## 68. Product Naming

Working name: **AI Field Capture**.

Alternatives: FieldCapture, CaptureMap, FieldLedger, AssetLens, InspectFlow, DataLens, FieldExtract.

The name should not imply a single domain (equipment, buildings) because the application is deliberately general.

## 69. Requirements Coverage Matrix

| Requirement | Where it is specified |
|---|---|
| Fields enabled once and reused while collecting (district, facility, department) | §20 Context fields; §12.2 `stickable`, `context_level` |
| Context hierarchy with per-record override | §20.2 |
| Dates and times set automatically | §21 Automatic fields |
| Captions applied to one photo, selected photos, or all photos | §23.2 |
| Adjusting captured data: adding and removing photos, editing values | §22.4, §38 |
| Extremely simple user interface | §3 (principle 2), §19, §55, §56 |
| Photos saved on the device in organised folders with subfolders | §8 |
| Database stored locally on the device | §8, §9 |
| Everything local except online AI, OCR and STT | §7 |
| Prefill from existing data by asset or serial number, then edit | §16, §17, §25 |
| Supplying the existing data record | §16.1, §46.3 |
| Record raw data first, map later | §26 |
| Whole project exportable, importable and analysable on another device | §45, §46 |
| Meeting minutes, refinement, attendance photos | §28 |
| Different templates auto-detected and data structured accordingly | §14 |
| Several people on one project, merge with conflict resolution | §44, §47, §48 |
| Original captions preserved, AI-refined stored in a separate column | §32, §50.1 rule 4 |
| Inventory of anything | §3 (principle 9), §6, §11, §13 |
| Predefined shipped templates, derived templates, templates from scratch | §11.1, §13 |
| Duplicate entries overridden after human review | §40 |
| No backend backup; local storage only; manual cloud upload button | §2.2, §7, §54 |
| Data suitable for data centres | §49.2 data dictionary, §49 JSON/CSV |
| Export and import: CSV, PDF, JSON, ZIP, XLSX | §49 |
| Upload to Google Drive, AWS and similar with user credentials | §54.2 |
| Prefilled templates: supplier or manufacturer lists matched by ID | §16.2, §16.3 |

---

# Appendix A — Worked Example

**Setting.** An operator is inventorying medical equipment across Uganda. Today: Kasubi Health Centre IV, Kampala.

**1. Context, set once.**

```text
District   Kampala            (set on arrival in the district)
Facility   Kasubi HC IV       (set on arrival at the facility)
Department Theatre            (set on entering the theatre)
```

Every record captured from now on inherits all three. No further typing of location.

**2. Capture, offline.** Three photos of an autoclave: front, rating plate, faulty pressure gauge. The operator speaks:

> "Thirteen litre autoclave in theatre, pressure gauge appears faulty."

Taps **Save raw — analyse later**. The record is stored immediately, with the date, time, operator, record number and context filled automatically. Photos land in:

```text
projects/2026-medical-equipment-inventory__p7k2/photos/Kampala/Kasubi-HC-IV/Theatre/
```

Eleven more items follow in the next twenty minutes, none of them analysed.

**3. Processing, at the guest house that evening.** **Process all (12)**. On-device OCR has already read the rating plates; the online step extracts fields against the Medical Equipment template, which was detected automatically from the photos and the OCR text.

**4. Review.**

```text
Equipment name   Autoclave         99%
Manufacturer     ABC Medical       94%   (matched to the Suppliers dataset)
Model            MED-1300          91%
Serial number    SN458923          98%
Capacity         13 L              96%
Condition        Faulty            83%   <- confirm
Purchase year    Not detected
Location         Theatre                 (context)
Captured         08 Sep 2026 09:12       (automatic)

Caption (raw)      "thirteen litre autoclave in theatre pressure gauge appears faulty"
Caption (refined)  "13 litre autoclave located in the theatre. Pressure gauge appears faulty."
```

The operator confirms the condition and taps **Approve & next**. The supplier's contact and country came from the Suppliers reference dataset without being typed.

**5. Duplicate.** Record 131 has the serial number SN458923 again. The app shows the comparison; the operator sees it is the same machine photographed twice, chooses **Override existing**, and the extra photos are attached to record 124.

**6. Merge.** A colleague covering the laboratory sends a bundle. Import shows 41 new records, 18 updates and 7 conflicts. Six are settled in bulk ("prefer the field team's values"); one — a condition disagreement backed by photos on both sides — is decided by looking at the evidence. **Undo merge** stays available.

**7. Export.**

```text
MEDICAL_EQUIPMENT_2026-09-08_v2.zip
├── data.xlsx              template columns, plus raw and AI-refined caption columns
├── data.csv
├── data.json              full provenance and confidence
├── report.pdf             photo report by facility
├── data_dictionary.csv
├── photos/Kampala/Kasubi-HC-IV/Theatre/AUTOCLAVE_SN458923_FRONT_01.jpg
└── manifest.json
```

The operator taps **Upload to cloud**, confirms the destination, and the ZIP goes to the organisation's Google Drive folder. Nothing else has left the device all day.

---

# Appendix B — Core Product Principle

> **The template defines what information is required. Photographs, documents, captions and voice provide the evidence. On-device and online AI turn that evidence into proposed values, never into invented ones. Raw input is kept forever beside the refined version. A person verifies the result. Only verified data is exported. Everything lives on the device unless the user sends it somewhere.**

This principle is what keeps the application flexible enough to inventory anything, auditable enough to be trusted, and safe enough to work offline in the field.
