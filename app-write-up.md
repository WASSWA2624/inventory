# AI Document & Asset Capture App

## 1. Project Overview

The **AI Document & Asset Capture App** is a Flutter-based mobile application designed to capture information from physical documents, equipment, buildings, assets, facilities, and other physical objects using photographs or scanned documents.

The application uses **AI-powered image/document analysis and OCR** to identify, extract, classify, and structure relevant information from captured images.

The extracted information is then automatically mapped into a **predefined Excel template** containing predefined columns/fields and rows.

The application is intended to significantly reduce manual data-entry work during:

* Asset inventories
* Equipment inspections
* Building/facility assessments
* Medical equipment inventories
* Property surveys
* Infrastructure assessments
* Field data collection
* Document digitization
* Audits
* Stock-taking
* Maintenance surveys
* Project assessments
* Compliance inspections

---

# 2. Core Concept

The basic workflow is:

```text
Excel Template
      │
      ▼
Create / Select Project
      │
      ▼
Define Required Fields
      │
      ▼
Capture Photos / Upload Documents
      │
      ▼
Add Caption / Voice Description
      │
      ▼
AI Analysis
      │
      ├── OCR
      ├── Object Recognition
      ├── Document Understanding
      ├── Field Extraction
      ├── Classification
      └── Confidence Scoring
      │
      ▼
Structured Data
      │
      ▼
Map Data to Excel Fields
      │
      ▼
User Review
      │
      ├── Approve
      ├── Edit
      └── Re-analyze
      │
      ▼
Save Record
      │
      ▼
Generate / Update Excel
      │
      ▼
Organized Photos + Excel Output
```

---

# 3. Example Use Case

Suppose an organization wants to inventory medical equipment.

The Excel template may contain:

| Asset ID | Equipment Name | Manufacturer | Model | Serial Number | Location | Condition | Year | Description | Photo |
| -------- | -------------- | ------------ | ----- | ------------- | -------- | --------- | ---- | ----------- | ----- |

A user walks into a facility.

They photograph an autoclave.

The photo contains:

* Manufacturer
* Model number
* Serial number
* Capacity
* Rating plate
* Equipment name

The user optionally says:

> "13 litre autoclave located in the laboratory. The pressure gauge appears faulty."

The application analyzes the photographs and speech transcript.

It may produce:

```json
{
  "equipment_name": "Autoclave",
  "manufacturer": "XYZ Medical",
  "model": "ABC-13",
  "serial_number": "SN123456",
  "capacity": "13 L",
  "location": "Laboratory",
  "condition": "Faulty pressure gauge",
  "description": "13 litre autoclave located in laboratory."
}
```

The application then maps these values to the corresponding Excel columns.

---

# 4. Main Objectives

The application should:

1. Capture images using the device camera.
2. Allow multiple photographs per record.
3. Allow users to upload existing images.
4. Allow document/PDF/image uploads where supported.
5. Capture captions using keyboard input.
6. Support speech-to-text captions.
7. Analyze photographs using AI.
8. Extract text using OCR.
9. Identify objects/equipment/buildings/documents.
10. Determine which extracted information belongs to which field.
11. Map extracted information to predefined Excel columns.
12. Save photographs with meaningful names.
13. Maintain relationships between photographs and records.
14. Allow users to review AI results.
15. Allow manual correction.
16. Generate/update Excel files.
17. Preserve the original Excel template.
18. Support multiple projects.
19. Support offline capture.
20. Synchronize captured records when connectivity becomes available.
21. Maintain an audit trail.
22. Prevent accidental data loss.

---

# 5. Target Platform

## Primary Platform

Flutter mobile application.

Initial target:

* Android

Future targets:

* iOS
* Windows
* Web

The architecture should avoid unnecessary platform-specific dependencies so that iOS support can be added later.

---

# 6. Recommended Technology Stack

## Frontend

```text
Flutter
Dart
Riverpod
GoRouter
Material 3
```

## Local Database

Recommended:

```text
Drift / SQLite
```

Alternative:

```text
Isar
```

SQLite/Drift is preferred where relational data and synchronization are important.

## Backend

Recommended:

```text
Node.js
Express.js
Prisma
MySQL
```

This backend architecture is suitable for:

* Authentication
* Project management
* Template management
* AI orchestration
* Data synchronization
* File management
* Excel generation
* Audit logging

## AI Layer

The AI provider should be abstracted behind an internal service.

Example:

```text
AIService
   │
   ├── OCR
   ├── Vision Analysis
   ├── Structured Extraction
   ├── Classification
   └── Validation
```

This allows the application to change AI providers without rewriting the Flutter application.

---

# 7. High-Level Architecture

```text
                    ┌──────────────────────┐
                    │      Flutter App     │
                    │                      │
                    │ Camera               │
                    │ Gallery              │
                    │ Documents            │
                    │ Voice Input          │
                    │ Review UI            │
                    │ Excel Template UI    │
                    └──────────┬───────────┘
                               │
                         REST / HTTPS
                               │
                               ▼
                    ┌──────────────────────┐
                    │     Backend API      │
                    │                      │
                    │ Authentication       │
                    │ Projects             │
                    │ Records              │
                    │ Templates            │
                    │ Uploads              │
                    │ AI orchestration     │
                    │ Excel generation     │
                    └──────────┬───────────┘
                               │
              ┌────────────────┼─────────────────┐
              │                │                 │
              ▼                ▼                 ▼
        ┌──────────┐     ┌───────────┐    ┌───────────┐
        │  MySQL   │     │ File      │    │ AI        │
        │ Database │     │ Storage   │    │ Provider  │
        └──────────┘     └───────────┘    └───────────┘
                               │
                               ▼
                         Excel Generator
```

---

# 8. Core Application Modules

The application should consist of the following modules:

```text
1. Authentication
2. Dashboard
3. Project Management
4. Excel Template Management
5. Schema / Field Management
6. Record Capture
7. Camera
8. Image Upload
9. Document Upload
10. Voice Input
11. AI Processing
12. Data Mapping
13. Review & Validation
14. Record Management
15. Photo Management
16. Excel Export
17. Synchronization
18. Settings
19. Audit Logs
```

---

# 9. Authentication

Users should be able to:

* Register
* Login
* Logout
* Reset password
* Change password
* View profile

Optional future functionality:

* Google login
* Microsoft login
* Organization login
* Role-based access control

---

# 10. User Roles

Recommended roles:

### Administrator

Can:

* Create users
* Create projects
* Upload templates
* Configure fields
* View all records
* Export Excel
* Delete records
* Manage settings

### Project Manager

Can:

* Create projects
* Upload templates
* Assign users
* Review records
* Export data

### Field User

Can:

* Capture images
* Upload documents
* Add captions
* Submit records
* Edit their own records

### Reviewer

Can:

* Review AI extraction
* Correct fields
* Approve records
* Reject records

---

# 11. Dashboard

The dashboard should display:

```text
Projects
Active Projects
Records Captured
Records Pending Review
Records Approved
AI Processing
Failed Processing
Photos Captured
Last Synchronization
```

Example:

```text
--------------------------------
AI FIELD CAPTURE
--------------------------------

Projects             8

Active Projects      3

Records
Captured             1,284

Pending Review       43

Approved             1,241

AI Processing        12

--------------------------------
Recent Projects
--------------------------------

Medical Equipment Audit
532 records

Facility Assessment
214 records

School Infrastructure Survey
538 records
```

---

# 12. Project Management

A project represents a data collection exercise.

Examples:

```text
2026 Medical Equipment Inventory
2026 Building Assessment
District Hospital Asset Survey
School Infrastructure Survey
```

Each project should contain:

```text
Project
 ├── Excel Template
 ├── Field Definitions
 ├── Records
 ├── Photos
 ├── Documents
 ├── AI Processing Results
 ├── Users
 └── Export Files
```

---

# 13. Creating a Project

Fields:

```text
Project Name
Description
Organization
Location
Start Date
End Date
Template
Project Status
```

Status:

```text
Draft
Active
Paused
Completed
Archived
```

---

# 14. Excel Template System

This is one of the most important components.

The user should be able to upload an existing Excel document.

Example:

```text
equipment_inventory.xlsx
```

The application reads the workbook and identifies:

* Sheets
* Header rows
* Columns
* Existing rows
* Formatting
* Merged cells
* Data types where possible

Example:

```text
A = Asset ID
B = Equipment Name
C = Manufacturer
D = Model
E = Serial Number
F = Location
G = Condition
H = Purchase Year
I = Description
J = Photo
```

---

# 15. Template Mapping

The application should convert the Excel structure into an internal schema.

Example:

```json
{
  "template_id": "TPL-001",
  "sheet": "Equipment",
  "fields": [
    {
      "key": "asset_id",
      "excel_column": "A",
      "label": "Asset ID",
      "type": "text"
    },
    {
      "key": "equipment_name",
      "excel_column": "B",
      "label": "Equipment Name",
      "type": "text"
    },
    {
      "key": "manufacturer",
      "excel_column": "C",
      "label": "Manufacturer",
      "type": "text"
    }
  ]
}
```

This schema becomes the application's internal data model.

---

# 16. Predefined Rows

The system should support templates where rows are already predefined.

For example:

```text
Row 2: Autoclave
Row 3: Microscope
Row 4: ECG Machine
Row 5: Weighing Scale
Row 6: Stethoscope
```

The AI should determine which predefined row the captured item belongs to.

For example:

```text
Photo
  ↓
AI identifies:
"Autoclave"
  ↓
Find predefined row:
"Autoclave"
  ↓
Populate that row
```

The user should also be able to create new rows where permitted.

---

# 17. Dynamic Schema

Although the initial application uses Excel, the internal system should NOT depend directly on Excel column letters.

Bad:

```text
if field == "B"
```

Better:

```text
field_key = "equipment_name"
```

Then map:

```text
equipment_name → Excel column B
```

This makes the application much more flexible.

---

# 18. Capture Screen

The capture screen is the heart of the application.

It should provide:

```text
----------------------------------
Capture Record
----------------------------------

Project:
Medical Equipment Inventory

Target:
Autoclave

[ 📷 Take Photo ]

[ 🖼 Select Photos ]

[ 📄 Upload Document ]

Photos:
----------------------------------
[Photo 1] [Photo 2] [Photo 3]
----------------------------------

Caption

[ 🎙 Speak ]

"13 litre autoclave in laboratory.
Pressure gauge appears faulty."

----------------------------------

[ CAPTURE & ANALYZE ]

----------------------------------
```

---

# 19. Multiple Photo Capture

A single record may contain multiple photographs.

Example:

```text
Autoclave
 ├── Front
 ├── Serial Number
 ├── Rating Plate
 ├── Side
 └── Fault
```

The user can capture multiple images before submitting.

The application should display:

```text
Photos: 5
```

and allow:

* Preview
* Delete
* Retake
* Reorder
* Add another image

---

# 20. Photo Grouping

Photos should belong to a single capture session.

Example:

```text
Capture Session
       │
       ├── IMG_001
       ├── IMG_002
       ├── IMG_003
       └── Caption
```

AI processes the entire group together.

This is important because one photograph may show the equipment while another contains the serial number.

---

# 21. Individual Photo Captions

Each photo may optionally have its own caption.

Example:

```text
Photo 1:
"Front view"

Photo 2:
"Serial number plate"

Photo 3:
"Faulty pressure gauge"
```

Captions can be entered by:

* Keyboard
* Speech-to-text

---

# 22. Group Caption

The entire capture session may also have one general description.

Example:

> "This is a 13L autoclave located in the laboratory. It appears operational but the pressure gauge is damaged."

The AI uses this caption as contextual information.

---

# 23. Speech-to-Text

The application should support voice input.

Workflow:

```text
Tap microphone
      ↓
Speak
      ↓
Speech recognition
      ↓
Text
      ↓
Caption field
```

The resulting text should be editable before submission.

Important:

Speech transcription should be treated as **supporting evidence**, not unquestioned truth.

---

# 24. AI Analysis Pipeline

When the user clicks:

```text
CAPTURE & ANALYZE
```

the system creates an analysis job.

Pipeline:

```text
Images
   │
   ▼
Image preprocessing
   │
   ▼
OCR
   │
   ▼
Vision analysis
   │
   ▼
Caption analysis
   │
   ▼
Object identification
   │
   ▼
Field extraction
   │
   ▼
Schema mapping
   │
   ▼
Validation
   │
   ▼
Confidence scoring
   │
   ▼
Review screen
```

---

# 25. Image Preprocessing

Before AI analysis, images may be processed to improve quality.

Possible operations:

* Resize
* Compress
* Rotate
* Crop
* Deskew
* Improve contrast
* Remove excessive noise
* Detect document boundaries

Original images should always be retained.

---

# 26. OCR

OCR should extract visible text.

Potential information:

```text
Manufacturer
Model
Serial Number
Part Number
Capacity
Voltage
Power
Manufacturing Date
Asset Number
Registration Number
Labels
Warning information
```

Example:

```text
OCR RESULT

Manufacturer: ABC Medical
Model: MED-1300
Serial: SN458923
Capacity: 13L
Voltage: 220V
```

---

# 27. Vision Analysis

Vision AI should determine:

* What object is shown?
* What type of equipment is it?
* What components are visible?
* What condition is visible?
* What damage is visible?
* What labels are present?
* What environment is it located in?

Example:

```json
{
  "object": "Autoclave",
  "condition": [
    "Pressure gauge appears damaged"
  ],
  "visible_components": [
    "Control panel",
    "Pressure gauge",
    "Door"
  ]
}
```

---

# 28. Contextual Analysis

AI should combine:

```text
Photo 1
+
Photo 2
+
Photo 3
+
OCR
+
Group caption
+
Individual captions
+
Project schema
+
Predefined rows
```

It should not analyze each image independently and blindly overwrite fields.

---

# 29. Structured AI Output

AI should return strict structured JSON.

Example:

```json
{
  "matched_row": "Autoclave",
  "fields": {
    "equipment_name": {
      "value": "Autoclave",
      "confidence": 0.99
    },
    "manufacturer": {
      "value": "ABC Medical",
      "confidence": 0.94
    },
    "model": {
      "value": "MED-1300",
      "confidence": 0.91
    },
    "serial_number": {
      "value": "SN458923",
      "confidence": 0.98
    },
    "capacity": {
      "value": "13 L",
      "confidence": 0.96
    },
    "condition": {
      "value": "Pressure gauge appears faulty",
      "confidence": 0.83
    }
  }
}
```

---

# 30. Confidence Scores

Every extracted field should have a confidence score.

Example:

```text
Equipment Name       99%
Manufacturer         94%
Model                91%
Serial Number        98%
Capacity              96%
Condition              83%
Purchase Year          42%
```

The application should highlight low-confidence values.

Suggested rules:

```text
90–100% = High confidence
70–89%  = Medium confidence
Below 70% = Review required
```

These thresholds should be configurable.

---

# 31. AI Must Not Invent Data

This is a critical requirement.

If the AI cannot determine a field, it should return:

```text
null
```

rather than guessing.

Example:

```json
{
  "purchase_year": null
}
```

The UI should display:

```text
Purchase Year
Not detected
```

instead of fabricating a year.

---

# 32. Review Screen

After AI processing, the user sees:

```text
-----------------------------------
Review Record
-----------------------------------

Equipment Name
[ Autoclave ]

Manufacturer
[ ABC Medical ]

Model
[ MED-1300 ]

Serial Number
[ SN458923 ]

Capacity
[ 13 L ]

Condition
[ Pressure gauge appears faulty ]

Location
[ Laboratory ]

-----------------------------------

AI Confidence

██████████ 98%

-----------------------------------

[ EDIT ]

[ APPROVE & SAVE ]
```

---

# 33. Field-Level Editing

Every extracted field should be editable.

The user should be able to:

* Correct spelling
* Replace incorrect value
* Add missing information
* Clear incorrect information
* Mark field as verified

Example:

```text
Serial Number

AI:
SN458923

User:
SN458928

[Save]
```

The system records the correction.

---

# 34. Evidence Tracking

Every extracted value should ideally have an evidence source.

Example:

```text
Serial Number:
SN458923

Source:
Photo 2
OCR
```

Another:

```text
Condition:
Pressure gauge faulty

Source:
Photo 3 + group caption
```

This makes the system useful for audits.

---

# 35. Data Provenance

Each field should record:

```text
value
source
confidence
extraction_method
verified_by
verified_at
```

Example:

```json
{
  "value": "SN458923",
  "source": "photo_002",
  "method": "OCR",
  "confidence": 0.98,
  "verified": true
}
```

---

# 36. Record Status

Each record should have a status:

```text
DRAFT
PROCESSING
AI_COMPLETED
REVIEW_REQUIRED
APPROVED
EXPORTED
SYNC_PENDING
SYNCED
FAILED
```

---

# 37. Photo Naming

Photos should not retain meaningless names such as:

```text
IMG_20260908_083455.jpg
```

The application should generate meaningful names.

Example:

```text
AUTCLAVE_SN458923_FRONT.jpg
AUTCLAVE_SN458923_SERIAL.jpg
AUTCLAVE_SN458923_FAULT.jpg
```

If the serial number is unavailable:

```text
AUTOCLAVE_000124_FRONT.jpg
AUTOCLAVE_000124_SERIAL.jpg
```

---

# 38. Photo Naming Rules

Recommended structure:

```text
{PROJECT}_{RECORD_ID}_{OBJECT}_{PHOTO_TYPE}_{SEQUENCE}.{extension}
```

Example:

```text
EQUIPMENT_AUDIT_REC000123_AUTOCLAVE_FRONT_01.jpg
```

However, filenames should use a safe normalized format.

---

# 39. Photo Metadata

Each photo should store:

```text
ID
Original filename
Generated filename
File path
Record ID
Capture time
GPS coordinates (optional)
Photo type
Caption
Upload status
Hash
```

GPS should be optional and configurable because location information may not always be appropriate.

---

# 40. Document Input

The application should support:

* JPG
* JPEG
* PNG
* HEIC where supported
* PDF
* Scanned documents

A PDF may contain multiple pages.

The system should treat each page as evidence.

Example:

```text
PDF
 ├── Page 1
 ├── Page 2
 └── Page 3
```

---

# 41. Document Analysis

For a document:

```text
Upload PDF
     ↓
Extract pages
     ↓
OCR / Document AI
     ↓
Identify fields
     ↓
Map fields
     ↓
Review
     ↓
Save
```

---

# 42. Excel Output

The application should produce an Excel file based on the original template.

Example:

```text
Original Template

Equipment | Manufacturer | Model | Serial | Condition
-------------------------------------------------------

Generated

Equipment  | Manufacturer | Model      | Serial   | Condition
Autoclave  | ABC Medical  | MED-1300   | SN458923 | Gauge faulty
Microscope | XYZ          | MIC-220    | SN783421 | Good
```

---

# 43. Preserve Original Excel Formatting

Where technically possible, the application should preserve:

* Column widths
* Fonts
* Borders
* Cell formatting
* Header styling
* Existing formulas
* Sheet names
* Frozen panes
* Existing workbook structure

The original template must never be overwritten.

Create a new output file.

Example:

```text
equipment_inventory_template.xlsx

↓

equipment_inventory_completed_2026-09-08.xlsx
```

---

# 44. Photo References in Excel

The system should support multiple approaches.

### Option A — Filename

Insert:

```text
AUTCLAVE_SN458923_FRONT.jpg
```

### Option B — Relative path

```text
photos/AUTCLAVE_SN458923_FRONT.jpg
```

### Option C — Embedded image

Where supported, embed the photograph directly into the workbook.

The project should initially support filename/path references and later add image embedding.

---

# 45. Export Package

A complete export may be:

```text
PROJECT_EXPORT/
│
├── data.xlsx
│
├── photos/
│   ├── AUTCLAVE_001_FRONT.jpg
│   ├── AUTCLAVE_001_SERIAL.jpg
│   └── AUTCLAVE_001_FAULT.jpg
│
├── documents/
│
└── manifest.json
```

The manifest records relationships between records and files.

---

# 46. Manifest Example

```json
{
  "project": "Medical Equipment Inventory 2026",
  "exported_at": "2026-09-08T08:30:00Z",
  "records": [
    {
      "record_id": "REC001",
      "excel_row": 2,
      "photos": [
        "photos/AUTOCLAVE_001_FRONT.jpg",
        "photos/AUTOCLAVE_001_SERIAL.jpg"
      ]
    }
  ]
}
```

---

# 47. Offline-First Architecture

Field environments may have poor or no internet connectivity.

Therefore, the application should support offline capture.

User should be able to:

```text
Open project
↓
Capture photos
↓
Record captions
↓
Save locally
```

without internet.

When connectivity returns:

```text
Local records
      ↓
Sync Queue
      ↓
Backend
      ↓
AI Processing
      ↓
Results
      ↓
Flutter App
```

---

# 48. Sync Queue

Local database should contain a synchronization queue.

Example:

```text
SYNC QUEUE

REC001    Pending Upload
REC002    Uploading
REC003    AI Processing
REC004    Completed
REC005    Failed
```

The application should automatically retry failed operations.

---

# 49. Network States

The UI should clearly indicate:

```text
● Online
● Offline
● Synchronizing
```

Example:

```text
Offline

Your captures are safely stored on this device.
They will synchronize automatically when internet
connection is restored.
```

---

# 50. Duplicate Detection

The application should attempt to detect duplicate captures.

Possible signals:

* Same image hash
* Similar image
* Same serial number
* Same asset number
* Same project
* Same location
* Similar object

Example warning:

```text
Possible duplicate detected.

Autoclave
Serial: SN458923

Existing record found.

[View Existing]
[Continue Anyway]
```

---

# 51. Data Validation

Before approving a record, the system should validate:

* Required fields
* Data types
* Serial number format
* Dates
* Numeric values
* Predefined values
* Duplicate identifiers

Example:

```text
Condition must be one of:

Good
Fair
Poor
Faulty
Not Working
Unknown
```

---

# 52. Required Fields

Templates should allow fields to be marked:

```text
Required
Optional
AI Recommended
Manual Only
```

Example:

```text
Equipment Name     Required
Serial Number      Required
Manufacturer       Optional
Condition           Required
Description         Optional
```

---

# 53. Field Types

Supported field types:

```text
Text
Long Text
Number
Decimal
Date
Time
DateTime
Boolean
Dropdown
Multi-select
Currency
Percentage
Photo
Document
GPS Location
```

---

# 54. Predefined Choices

For fields such as condition:

```text
Good
Fair
Poor
Faulty
Not Working
Missing
Unknown
```

AI should map natural language to these choices.

Example:

AI detects:

> "Gauge damaged and equipment requires repair."

It maps:

```text
Condition = Faulty
```

while preserving the detailed description separately.

---

# 55. AI Mapping Logic

Mapping should use multiple signals.

Priority:

```text
1. Explicit OCR text
2. Exact identifier
3. Template field semantics
4. Caption
5. Vision analysis
6. Context
```

The system should avoid overwriting verified user data unless explicitly instructed.

---

# 56. Data Conflict Resolution

If multiple sources disagree:

```text
OCR:
Serial = SN123456

Caption:
Serial = SN123465
```

the application should flag:

```text
Conflict detected

Serial Number

Photo OCR:
SN123456

User caption:
SN123465

Please verify.
```

---

# 57. AI Processing Jobs

AI processing should be asynchronous.

Architecture:

```text
Flutter
   ↓
POST /captures
   ↓
Backend
   ↓
Create AI Job
   ↓
Queue
   ↓
AI Worker
   ↓
AI Provider
   ↓
Store Result
   ↓
Flutter retrieves result
```

This prevents long-running requests from blocking the mobile application.

---

# 58. Processing Progress

The app should show:

```text
Analyzing capture...

✓ Uploading photos
✓ Reading document
✓ Extracting text
● Identifying equipment
○ Mapping fields
○ Validating results
```

---

# 59. Error Handling

Possible errors:

```text
Poor image quality
AI unavailable
Network failure
Unsupported document
OCR failure
Invalid Excel template
Excel generation failure
Storage failure
```

Example:

```text
We couldn't confidently read the serial number.

Try taking a closer photograph of the serial-number label.

[Retake Photo]
[Continue Without Serial Number]
```

---

# 60. Image Quality Detection

Before submitting an image, the application should detect obvious problems.

Examples:

```text
Image too dark
Image blurry
Text too small
Object partially hidden
Image overexposed
```

The application can warn:

```text
The serial number may be difficult to read.

Move closer and capture again?
```

---

# 61. Camera Features

Camera screen should provide:

* Flash
* Zoom
* Focus
* Grid
* Retake
* Image preview
* Document mode
* Barcode/QR scanning where appropriate

Optional future feature:

Automatic document edge detection.

---

# 62. Barcode / QR Support

If assets contain:

* QR codes
* Barcodes
* Asset labels

the application should be able to scan them.

Example:

```text
Scan Asset ID
      ↓
ASSET-000123
      ↓
Load existing record
```

This can significantly improve accuracy.

---

# 63. Search

Users should be able to search records by:

```text
Asset ID
Equipment
Serial Number
Manufacturer
Location
Condition
Date
User
Status
```

---

# 64. Record Detail Screen

Example:

```text
--------------------------------
Autoclave
--------------------------------

Asset ID:
AST-00123

Manufacturer:
ABC Medical

Model:
MED-1300

Serial:
SN458923

Capacity:
13 L

Condition:
Faulty

Location:
Laboratory

--------------------------------
Photos

[Photo] [Photo] [Photo]

--------------------------------

AI Analysis
Confidence: 94%

--------------------------------

Created:
08 Sep 2026

Captured by:
Field User

Status:
Approved
```

---

# 65. Record History

Every record should have a history.

Example:

```text
08:21 Created
08:22 AI analyzed
08:23 User corrected serial number
08:24 Submitted for review
08:26 Approved
08:27 Exported
```

---

# 66. Audit Trail

Audit logs should record:

```text
User
Action
Record
Timestamp
Previous Value
New Value
Device
```

Example:

```text
User changed:

Serial Number

From:
SN458923

To:
SN458928

Date:
08 Sep 2026
```

---

# 67. Database Design

Recommended entities:

```text
users
organizations
projects
templates
template_sheets
template_fields
template_rows
records
record_fields
photos
documents
captions
ai_jobs
ai_results
field_evidence
sync_queue
exports
audit_logs
```

---

# 68. User

```text
User
----
id
name
email
password_hash
role
organization_id
created_at
updated_at
```

---

# 69. Project

```text
Project
-------
id
name
description
organization_id
template_id
status
start_date
end_date
created_by
created_at
updated_at
```

---

# 70. Template

```text
Template
--------
id
name
original_filename
storage_path
version
created_by
created_at
updated_at
```

---

# 71. Template Field

```text
TemplateField
-------------
id
template_id
sheet_id
field_key
label
excel_column
data_type
required
default_value
options
mapping_rules
created_at
```

---

# 72. Template Row

```text
TemplateRow
-----------
id
template_id
sheet_id
excel_row_number
identifier
label
metadata
```

Example:

```text
excel_row_number = 7
identifier = "autoclave"
label = "Autoclave"
```

---

# 73. Record

```text
Record
------
id
project_id
template_row_id
record_number
status
confidence
captured_by
captured_at
created_at
updated_at
```

---

# 74. Record Field

```text
RecordField
-----------
id
record_id
template_field_id
value
confidence
source
verified
verified_by
verified_at
created_at
updated_at
```

---

# 75. Photo

```text
Photo
-----
id
record_id
original_filename
stored_filename
storage_path
photo_type
caption
mime_type
file_size
hash
captured_at
latitude
longitude
created_at
```

---

# 76. AI Job

```text
AIJob
-----
id
record_id
status
provider
model
prompt_version
started_at
completed_at
error_message
created_at
```

---

# 77. Evidence

```text
FieldEvidence
-------------
id
record_field_id
photo_id
document_id
evidence_text
evidence_type
confidence
created_at
```

---

# 78. API Design

Recommended API structure:

```text
/api/v1/auth
/api/v1/users
/api/v1/projects
/api/v1/templates
/api/v1/records
/api/v1/photos
/api/v1/documents
/api/v1/captures
/api/v1/ai
/api/v1/exports
/api/v1/sync
/api/v1/audit
```

---

# 79. Authentication APIs

```text
POST /auth/register
POST /auth/login
POST /auth/logout
POST /auth/refresh
POST /auth/forgot-password
POST /auth/reset-password
GET  /auth/me
```

---

# 80. Project APIs

```text
GET    /projects
POST   /projects
GET    /projects/:id
PATCH  /projects/:id
DELETE /projects/:id
```

---

# 81. Template APIs

```text
POST /templates/upload
GET  /templates
GET  /templates/:id
GET  /templates/:id/schema
POST /templates/:id/validate
```

---

# 82. Capture APIs

```text
POST /captures
GET  /captures/:id
POST /captures/:id/analyze
POST /captures/:id/approve
DELETE /captures/:id
```

---

# 83. Record APIs

```text
GET   /records
POST  /records
GET   /records/:id
PATCH /records/:id
DELETE /records/:id
```

---

# 84. Photo APIs

```text
POST   /records/:id/photos
GET    /records/:id/photos
DELETE /photos/:id
```

---

# 85. AI API

```text
POST /ai/analyze
GET  /ai/jobs/:id
POST /ai/jobs/:id/retry
```

---

# 86. Export APIs

```text
POST /exports
GET  /exports
GET  /exports/:id
GET  /exports/:id/download
```

---

# 87. Flutter Project Structure

Recommended:

```text
lib/
│
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── storage/
│   ├── utils/
│   └── widgets/
│
├── features/
│   │
│   ├── auth/
│   │
│   ├── dashboard/
│   │
│   ├── projects/
│   │
│   ├── templates/
│   │
│   ├── capture/
│   │   ├── camera/
│   │   ├── gallery/
│   │   ├── documents/
│   │   ├── voice/
│   │   └── analysis/
│   │
│   ├── records/
│   │
│   ├── review/
│   │
│   ├── exports/
│   │
│   ├── sync/
│   │
│   └── settings/
│
└── shared/
```

---

# 88. Flutter Architecture

Use feature-first architecture with separation between:

```text
Presentation
Domain
Data
```

Example:

```text
capture/
│
├── data/
│   ├── capture_repository_impl.dart
│   ├── capture_remote_data_source.dart
│   └── capture_local_data_source.dart
│
├── domain/
│   ├── capture.dart
│   ├── capture_repository.dart
│   └── capture_service.dart
│
└── presentation/
    ├── capture_screen.dart
    ├── capture_controller.dart
    └── widgets/
```

---

# 89. State Management

Use Riverpod.

Examples:

```text
authProvider
projectsProvider
currentProjectProvider
templateProvider
captureProvider
cameraProvider
aiJobProvider
recordsProvider
syncProvider
```

---

# 90. Navigation

Recommended routes:

```text
/login
/dashboard
/projects
/projects/:id
/projects/:id/capture
/projects/:id/records
/projects/:id/templates
/capture/:id/review
/records/:id
/settings
```

---

# 91. Local Storage

Store locally:

```text
Project metadata
Template schema
Unsubmitted records
Photos
Captions
AI results
Sync queue
User preferences
```

Large files should use filesystem storage rather than putting image binaries directly inside SQLite.

---

# 92. Security

Security requirements:

* HTTPS
* Secure authentication
* Token expiration
* Refresh tokens
* Password hashing
* Role-based authorization
* File access control
* Encryption where appropriate
* Audit logging
* Secure local storage for sensitive credentials

Never store API keys inside the Flutter application.

AI provider API keys must remain on the backend.

---

# 93. File Storage

Recommended structure:

```text
storage/
│
├── organizations/
│
│   └── {organization_id}/
│
│       └── projects/
│
│           └── {project_id}/
│
│               ├── templates/
│               ├── photos/
│               ├── documents/
│               └── exports/
```

---

# 94. AI Prompt Architecture

AI prompts should be generated dynamically from the project schema.

Example:

```text
You are an information extraction system.

Project:
Medical Equipment Inventory

Available fields:

Equipment Name
Manufacturer
Model
Serial Number
Capacity
Location
Condition
Description

Available predefined equipment:
Autoclave
Microscope
ECG Machine
Weighing Scale
Stethoscope

Analyze the supplied images and captions.

Only return information supported by the evidence.

Do not invent missing information.

Return valid JSON.
```

---

# 95. Structured Output Enforcement

The backend should validate AI output against a JSON schema before saving.

Example:

```text
AI
 ↓
JSON
 ↓
Schema Validation
 ↓
Valid?
 ├── YES → Save
 └── NO  → Retry / Repair
```

Never trust raw AI output directly.

---

# 96. AI Provider Abstraction

Create:

```typescript
interface VisionAIProvider {
  analyzeImages(input: AnalysisInput): Promise<AnalysisResult>;
}
```

Possible implementations:

```text
OpenAIProvider
AnthropicProvider
GeminiProvider
LocalVisionProvider
```

The application can therefore change providers later.

---

# 97. AI Cost Management

Because field projects may involve thousands of photographs, AI processing should be optimized.

Techniques:

* Resize images
* Compress images
* Avoid duplicate analysis
* Cache OCR results
* Process multiple related images together
* Use cheaper models for preliminary classification
* Use more capable models only when necessary
* Allow manual processing
* Queue AI jobs

---

# 98. Two-Stage AI Pipeline

A recommended optimization:

```text
Stage 1
Cheap / fast analysis

Identify:
- object
- likely record
- basic OCR
- image quality

          ↓

Stage 2
Advanced analysis

Extract:
- detailed fields
- condition
- relationships
- ambiguous information
```

This can reduce AI costs substantially.

---

# 99. Human-in-the-Loop Principle

AI should assist humans, not silently replace verification.

Recommended workflow:

```text
AI Extracts
     ↓
Confidence Score
     ↓
High Confidence
     ↓
Auto-populate

Low Confidence
     ↓
Require Review
```

Critical fields such as:

* Serial number
* Asset ID
* Financial value
* Date
* Location

should optionally require manual verification.

---

# 100. Excel Mapping Engine

The mapping engine should be independent of the AI.

Architecture:

```text
AI Result
    ↓
Normalized Data
    ↓
Mapping Engine
    ↓
Template Schema
    ↓
Excel Row/Column
```

Example:

```text
AI:
serial_number

Schema:
serial_number → column E

Excel:
E7 = SN458923
```

---

# 101. Normalization

AI values should be normalized.

Examples:

```text
"13 litre"
"13L"
"13 Litre Capacity"
```

can normalize to:

```text
13 L
```

Similarly:

```text
"not working"
"doesn't work"
"dead"
"non-functional"
```

can map to:

```text
Not Working
```

---

# 102. Excel Row Matching

For predefined rows, use:

```text
Exact matching
Alias matching
Semantic matching
AI classification
```

Example:

```text
"BP machine"
"blood pressure machine"
"blood pressure monitor"
"sphygmomanometer"
```

may map to:

```text
Blood Pressure Machine
```

The mapping should be configurable.

---

# 103. Duplicate Row Protection

Before writing a new record:

```text
Check:
Asset ID
Serial Number
Existing record
```

If a matching record exists:

```text
Existing record found.

[Update Existing]
[Create New]
[Cancel]
```

---

# 104. Excel Versioning

Each export should have a version.

Example:

```text
Export v1
Export v2
Export v3
```

Never destroy previous exports.

---

# 105. Project Backup

The backend should periodically back up:

```text
Database
Photos
Documents
Templates
Exports
Audit logs
```

---

# 106. App Settings

Settings should include:

```text
AI Processing
Image Quality
Auto Upload
Offline Mode
Voice Language
Default Camera Mode
GPS Capture
Compression
Auto Naming
Export Preferences
```

---

# 107. Voice Languages

The architecture should support multiple languages.

Initial:

```text
English
```

Potential future:

```text
Luganda
Swahili
Runyankole
Acholi
Arabic
French
```

---

# 108. Accessibility

Support:

* Large text
* High contrast
* Screen readers
* Clear buttons
* Large camera controls
* Voice input

---

# 109. Performance Requirements

The app should:

* Open quickly
* Avoid loading all project photos at once
* Use pagination
* Compress images before upload
* Process large datasets incrementally
* Avoid blocking the UI
* Perform synchronization in the background

---

# 110. Capture Performance

A user should be able to capture several photos rapidly.

The UI should not wait for AI processing before allowing the next capture.

Recommended:

```text
Capture
↓
Save locally immediately
↓
Continue capturing
↓
Upload/AI process in background
```

---

# 111. Batch Capture Mode

A future/high-priority feature.

Instead of:

```text
Capture
Analyze
Review
Capture
Analyze
Review
```

allow:

```text
CAPTURE MODE

Record 1 → Photos
Record 2 → Photos
Record 3 → Photos
Record 4 → Photos

        ↓

PROCESS ALL
```

This is ideal for large field surveys.

---

# 112. Intelligent Capture Mode

Future enhancement:

User points camera at equipment.

Application automatically detects:

```text
Object
Serial Number
Asset ID
Manufacturer
```

and suggests:

```text
"Autoclave detected."

[Capture Record]
```

---

# 113. Automatic Photo Classification

Multiple images can automatically be classified:

```text
FRONT
BACK
SERIAL_NUMBER
RATING_PLATE
DAMAGE
CONTROL_PANEL
LOCATION
OTHER
```

This classification can be used in filenames and evidence tracking.

---

# 114. Location Capture

Optional GPS information:

```text
Latitude
Longitude
Accuracy
Timestamp
```

The system can associate the location with a record.

Example:

```text
Autoclave
Location:
0.3476, 32.5825
```

GPS should only be collected when enabled and permitted.

---

# 115. Map Integration

Future feature:

Display captured assets on a map.

Example:

```text
         MAP

  ● Autoclave
      ● ECG
             ● Microscope

```

Useful for:

* Buildings
* Infrastructure
* Facilities
* Utility assets
* Equipment distribution

---

# 116. Building Assessment Mode

The same system should support buildings.

Example template:

```text
Building Name
Building Type
Number of Floors
Roof Condition
Wall Condition
Floor Condition
Electrical Condition
Plumbing Condition
Accessibility
Overall Condition
Comments
```

Photos can show:

```text
Exterior
Roof
Walls
Floors
Electrical
Bathrooms
Doors
Windows
Damage
```

AI maps observations to the predefined fields.

---

# 117. Equipment Assessment Mode

Example:

```text
Equipment Name
Manufacturer
Model
Serial Number
Asset Number
Location
Condition
Functional Status
Fault
Required Spare Parts
Estimated Repair Cost
Purchase Date
```

---

# 118. Inspection Mode

Example template:

```text
Inspection Item
Requirement
Observed Condition
Compliance
Risk
Recommendation
Photo Evidence
```

AI can populate observations from photographs.

---

# 119. Risk Classification

Future AI functionality:

```text
Low
Medium
High
Critical
```

Example:

```text
Exposed electrical wiring

Risk:
High

Recommendation:
Immediate electrical inspection.
```

All risk classifications should be presented as AI suggestions requiring appropriate human review.

---

# 120. Notifications

The app may notify users:

```text
AI processing complete
Review required
Synchronization complete
Export ready
Sync failed
```

---

# 121. Analytics

Dashboard analytics could include:

```text
Records per day
Records per user
AI accuracy
Correction rate
Processing failures
Projects completed
Photos captured
```

AI correction rate is particularly useful.

Example:

```text
AI Field Accuracy

Serial Number      98%
Manufacturer       94%
Condition           88%
Location            91%
```

These figures should be based on verified human corrections rather than arbitrary AI confidence.

---

# 122. AI Learning / Feedback

The system should record user corrections.

Example:

```text
AI:
Autoclave

User:
Sterilizer
```

These corrections can later be used to improve:

* Prompting
* Mapping rules
* Aliases
* Classification
* Validation

Do not automatically train models from corrections without an explicit data governance policy.

---

# 123. Template Builder

A future feature should allow users to build templates inside the app.

Example:

```text
Template Builder

+ Add Field

Field:
Equipment Name

Type:
Text

Required:
Yes

AI Extraction:
Yes
```

This removes dependence on manually editing Excel templates.

---

# 124. Template Mapping UI

When an Excel template is uploaded:

```text
Excel Column          Internal Field

Equipment Name   →    equipment_name
Manufacturer     →    manufacturer
Model            →    model
Serial Number    →    serial_number
Condition        →    condition
```

Users can manually correct mappings.

---

# 125. AI-Assisted Template Mapping

The application can automatically suggest mappings.

Example:

```text
Excel Header:
"Manufacturer / Brand"

Suggested field:
manufacturer

Confidence:
96%

[Accept]
```

---

# 126. Import Existing Excel Data

The application should support importing existing records.

Workflow:

```text
Upload Excel
     ↓
Read template
     ↓
Read existing rows
     ↓
Convert to records
     ↓
Store in database
```

This enables users to continue existing inventories.

---

# 127. Conflict During Import

If an imported record already exists:

```text
Duplicate record detected.

Serial:
SN458923

[Keep Existing]
[Replace]
[Merge]
```

---

# 128. Data Export Formats

Initial:

```text
XLSX
```

Future:

```text
CSV
PDF
JSON
ZIP
```

---

# 129. API Rate Limiting

Backend should implement:

* Rate limiting
* File upload limits
* Request size limits
* AI request throttling
* Authentication protection

---

# 130. File Validation

Uploaded files must be checked for:

```text
Extension
MIME type
File size
Corruption
Malicious content
```

Do not trust filename extensions alone.

---

# 131. Image Compression

Recommended workflow:

```text
Original photo
     ↓
Store original locally
     ↓
Create optimized upload version
     ↓
Upload optimized version
     ↓
Keep original according to retention policy
```

---

# 132. Data Retention

The project should support configurable retention policies.

Example:

```text
Photos:
Permanent

AI Results:
Permanent

Temporary processing files:
Delete after 7 days
```

---

# 133. Privacy

The application may process photographs containing:

* People
* Documents
* Locations
* Identifiers

Therefore, privacy controls are required.

Possible future feature:

```text
Automatic face detection
Automatic face blurring
Sensitive document redaction
```

---

# 134. Testing Strategy

Testing should cover:

## Unit Tests

* Mapping
* Normalization
* Validation
* File naming
* Excel schema parsing
* Confidence calculations

## Widget Tests

* Capture UI
* Review UI
* Template UI
* Record UI

## Integration Tests

* Camera → Capture
* Capture → Upload
* AI → Result
* Result → Excel

## End-to-End Tests

```text
Login
↓
Create Project
↓
Upload Excel
↓
Capture Photo
↓
Add Caption
↓
Analyze
↓
Review
↓
Approve
↓
Export Excel
```

---

# 135. Critical Test Cases

### Test 1 — Single Photo

Input:

```text
One equipment photo
```

Expected:

```text
Equipment identified
Fields extracted
Excel populated
```

### Test 2 — Multiple Photos

Input:

```text
Front + serial number + fault
```

Expected:

```text
Information combined correctly
```

### Test 3 — Missing Information

Input:

```text
Equipment photo without serial number
```

Expected:

```text
Serial = null
```

No hallucination.

### Test 4 — Duplicate

Input:

```text
Same serial number twice
```

Expected:

```text
Duplicate warning
```

### Test 5 — Offline

Input:

```text
No internet
```

Expected:

```text
Capture saved locally
```

### Test 6 — AI Failure

Expected:

```text
Capture remains safe
Retry available
```

---

# 136. MVP Scope

The first version should NOT attempt to implement every future feature.

Recommended MVP:

## Phase 1

### Authentication

* Login
* Logout

### Projects

* Create project
* Select project

### Excel

* Upload template
* Read headers
* Define fields

### Capture

* Camera
* Gallery
* Multiple photos
* Caption
* Speech-to-text

### AI

* OCR
* Vision analysis
* Structured extraction

### Review

* Display extracted data
* Edit fields
* Approve

### Export

* Populate Excel
* Download/share Excel

### Storage

* Local draft storage
* Backend synchronization

---

# 137. MVP Workflow

The complete MVP workflow:

```text
LOGIN
  ↓
CREATE PROJECT
  ↓
UPLOAD EXCEL TEMPLATE
  ↓
CONFIGURE FIELDS
  ↓
OPEN CAPTURE
  ↓
TAKE / SELECT PHOTOS
  ↓
ADD CAPTION
  ↓
CAPTURE & ANALYZE
  ↓
AI PROCESSING
  ↓
REVIEW DATA
  ↓
EDIT IF NECESSARY
  ↓
APPROVE
  ↓
SAVE RECORD
  ↓
NEXT RECORD
  ↓
EXPORT EXCEL
```

---

# 138. Phase 2

Add:

```text
Offline-first synchronization
Batch capture
Barcode / QR
GPS
Advanced template builder
Better Excel formatting preservation
Document/PDF processing
Audit trails
Roles
```

---

# 139. Phase 3

Add:

```text
AI-assisted template creation
Automatic photo classification
Building assessment
Inspection workflows
Map visualization
Advanced analytics
Multi-language voice input
AI correction learning
Enterprise administration
```

---

# 140. Phase 4

Potential advanced capabilities:

```text
Real-time camera recognition
Automatic asset identification
Predictive maintenance suggestions
Condition scoring
Risk scoring
Computer vision measurements
Automated compliance assessment
Digital asset registry
```

---

# 141. Important Design Principle

The application should be designed around the following hierarchy:

```text
EVIDENCE
   ↓
EXTRACTION
   ↓
NORMALIZATION
   ↓
VALIDATION
   ↓
MAPPING
   ↓
HUMAN REVIEW
   ↓
FINAL DATA
   ↓
EXCEL
```

Do not allow:

```text
AI
 ↓
Excel
```

without validation.

---

# 142. Recommended Record Lifecycle

```text
CAPTURED
   ↓
LOCAL_SAVED
   ↓
UPLOADED
   ↓
PROCESSING
   ↓
EXTRACTED
   ↓
REVIEW_REQUIRED
   ↓
VERIFIED
   ↓
APPROVED
   ↓
EXPORTED
```

---

# 143. UI Design Principles

The interface should be:

* Modern
* Minimal
* Fast
* Field-worker friendly
* Large touch targets
* Easy to use outdoors
* Clear status indicators
* Minimal typing
* Camera-first
* Voice-friendly

The most important action should always be obvious:

```text
CAPTURE
```

---

# 144. Suggested Bottom Navigation

```text
Home
Projects
Capture
Records
Settings
```

The central Capture action can be visually emphasized.

---

# 145. Capture UX Principle

A field worker should ideally be able to create a record using:

```text
1. Point camera
2. Take photos
3. Speak description
4. Tap Capture & Analyze
5. Review
6. Save
```

The application should minimize typing.

---

# 146. Example Complete Session

User opens:

```text
Medical Equipment Inventory
```

Selects:

```text
Laboratory
```

Takes three photographs:

```text
1. Front
2. Rating plate
3. Pressure gauge
```

Speaks:

> "This is a 13 litre autoclave in the laboratory. The pressure gauge appears faulty."

User taps:

```text
CAPTURE & ANALYZE
```

AI detects:

```text
Equipment:
Autoclave

Manufacturer:
ABC Medical

Model:
MED-1300

Serial:
SN458923

Capacity:
13 L

Location:
Laboratory

Condition:
Faulty

Fault:
Pressure gauge appears faulty
```

The system finds:

```text
Template row:
Autoclave
```

It maps the values.

User reviews:

```text
✓ Equipment
✓ Manufacturer
✓ Model
✓ Serial
✓ Capacity
✓ Location
⚠ Condition
```

User confirms condition.

The application saves:

```text
Record #124
```

Photos become:

```text
AUTOCLAVE_SN458923_FRONT.jpg
AUTOCLAVE_SN458923_RATING_PLATE.jpg
AUTOCLAVE_SN458923_PRESSURE_GAUGE.jpg
```

Excel becomes:

```text
Equipment | Manufacturer | Model | Serial | Capacity | Location | Condition
Autoclave | ABC Medical  | MED-1300 | SN458923 | 13 L | Laboratory | Faulty
```

---

# 147. Recommended Development Order

Development should proceed in this order:

## Sprint 1

```text
Flutter project
Architecture
Theme
Navigation
Authentication
```

## Sprint 2

```text
Projects
Local database
Project records
```

## Sprint 3

```text
Excel template upload
Excel schema parser
Template mapping
```

## Sprint 4

```text
Camera
Gallery
Multi-photo capture
Local image storage
```

## Sprint 5

```text
Captions
Speech-to-text
Capture sessions
```

## Sprint 6

```text
Backend upload
AI service
OCR
Vision extraction
Structured JSON
```

## Sprint 7

```text
Review screen
Field editing
Confidence scores
Validation
```

## Sprint 8

```text
Excel generation
Export
Photo naming
```

## Sprint 9

```text
Offline synchronization
Retry queues
Error handling
```

## Sprint 10

```text
Testing
Performance
Security
Production release
```

---

# 148. Definition of Done for MVP

The MVP is complete when a user can:

* Login
* Create a project
* Upload an Excel template
* Configure/map fields
* Open camera
* Capture multiple photos
* Upload photos from gallery
* Add a text caption
* Speak a caption
* Submit capture
* Have AI analyze the images
* Extract structured information
* Match the information to predefined rows
* Review the information
* Correct fields
* Approve the record
* Save the record
* Name photos automatically
* Generate the completed Excel document
* Export the Excel file
* Recover safely from network/AI failure

---

# 149. Long-Term Product Vision

The ultimate product should evolve into a general-purpose:

## AI Field Data Collection Platform

Instead of building separate applications for:

```text
Equipment Inventory
Building Assessment
Vehicle Inspection
Infrastructure Survey
Medical Equipment Audit
School Assessment
Warehouse Inventory
Property Inspection
```

the same application can support all of them through configurable templates.

The fundamental model becomes:

```text
ANY TEMPLATE
      +
ANY PHYSICAL OBJECT / DOCUMENT
      +
PHOTOS
      +
VOICE
      +
AI
      ↓
STRUCTURED DATA
      ↓
EXCEL / DATABASE / REPORT
```

This makes the application a reusable platform rather than a single-purpose inventory application.

---

# 150. Final Architecture

The final system should conceptually operate as:

```text
                    USER
                     │
                     ▼
              ┌─────────────┐
              │ Flutter App │
              └──────┬──────┘
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
     Camera       Voice       Documents
        │            │            │
        └────────────┼────────────┘
                     ▼
              Capture Session
                     │
                     ▼
              Local Storage
                     │
                     ▼
                 Backend
                     │
             ┌───────┴────────┐
             │                │
             ▼                ▼
          Database          AI Engine
                              │
                    ┌─────────┼─────────┐
                    ▼         ▼         ▼
                   OCR      Vision    Context
                    │         │         │
                    └─────────┼─────────┘
                              ▼
                       Structured Data
                              │
                              ▼
                       Validation Engine
                              │
                              ▼
                       Mapping Engine
                              │
                              ▼
                         Review UI
                              │
                              ▼
                           APPROVE
                              │
                              ▼
                       Record Database
                              │
                              ▼
                       Excel Generator
                              │
                              ▼
                       Final Excel File
                              │
                              ▼
                    Photos + Manifest
```

---

# 151. Core Product Principle

The most important architectural rule for this application is:

> **The Excel template defines what information is required; the photographs, documents, and captions provide the evidence; AI extracts the evidence into structured fields; the user validates the result; and only verified data is written into the final Excel output.**

This principle keeps the system flexible, auditable, and resistant to AI hallucination.

---

# 152. Suggested Product Name

Possible names:

```text
FieldAI
InspectAI
CaptureAI
AssetVision
FieldVision
ScanMap
DataLens
CaptureMap
VisionLedger
AssetLens
InspectFlow
Doc2Excel AI
FieldExtract
```

A particularly descriptive working name is:

**CaptureMap AI**

because the system captures real-world evidence and maps it into structured data.

---

# 153. Immediate Development Goal

The first development milestone should be a working vertical slice:

```text
Flutter
  ↓
Create Project
  ↓
Upload Excel Template
  ↓
Take 2–3 Photos
  ↓
Speak Caption
  ↓
Send to Backend
  ↓
AI Vision + OCR
  ↓
Return JSON
  ↓
Show Review Screen
  ↓
Approve
  ↓
Write One Row
  ↓
Export Excel
```

Once this complete path works reliably, the remaining functionality can be added around it.

This vertical slice should be built before implementing advanced dashboards, analytics, maps, roles, or other secondary functionality.
