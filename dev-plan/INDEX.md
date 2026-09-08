# Tapture — task index

466 tasks across 24 phases. Work top to bottom.

## 01 — Orchestration & working agreements

*Decisions made once, then obeyed by every later task. No app code here.*

- [ ] [001 — How to use this plan](01-orchestration/001-how-to-use-this-plan.md)
- [ ] [002 — Definition of ready and definition of done](01-orchestration/002-definition-of-ready-and-done.md)
- [ ] [003 — Coding standards and naming](01-orchestration/003-coding-standards.md)
- [ ] [004 — Layering and dependency direction](01-orchestration/004-architecture-rules.md)
- [ ] [005 — Component reuse policy](01-orchestration/005-reuse-policy.md)
- [ ] [006 — Riverpod conventions](01-orchestration/006-state-management-conventions.md)
- [ ] [007 — Error handling and user-facing failures](01-orchestration/007-error-handling-policy.md)
- [ ] [008 — Logging and diagnostics](01-orchestration/008-logging-policy.md)
- [ ] [009 — Testing policy per layer](01-orchestration/009-testing-policy.md)
- [ ] [010 — Responsiveness and layout rules](01-orchestration/010-responsiveness-policy.md)
- [ ] [011 — Accessibility rules](01-orchestration/011-accessibility-policy.md)
- [ ] [012 — Offline-first rules](01-orchestration/012-offline-first-rules.md)
- [ ] [013 — Data safety and durability rules](01-orchestration/013-data-safety-rules.md)
- [ ] [014 — Secrets and untrusted input](01-orchestration/014-security-policy.md)
- [ ] [015 — Branching, commits and review](01-orchestration/015-branching-and-commits.md)
- [ ] [016 — Pull request review checklist](01-orchestration/016-review-checklist.md)
- [ ] [017 — Code names for spec concepts](01-orchestration/017-naming-glossary.md)
- [ ] [018 — Approved dependency list](01-orchestration/018-dependency-allowlist.md)

## 02 — Project foundation

*The empty app that boots, logs, fails safely and knows what device it is on.*

- [ ] [019 — Create the Flutter project](02-foundation/019-flutter-project-init.md)
- [ ] [020 — Repository hygiene](02-foundation/020-repo-hygiene.md)
- [ ] [021 — Strict analyzer configuration](02-foundation/021-strict-lints.md)
- [ ] [022 — Create the folder skeleton](02-foundation/022-folder-scaffold.md)
- [ ] [023 — Application bootstrap](02-foundation/023-app-bootstrap.md)
- [ ] [024 — Shared constants](02-foundation/024-app-constants.md)
- [ ] [025 — Result type and failure taxonomy](02-foundation/025-result-and-failures.md)
- [ ] [026 — Logger service](02-foundation/026-logger-service.md)
- [ ] [027 — Export diagnostics log](02-foundation/027-log-export-action.md)
- [ ] [028 — Error boundary widget](02-foundation/028-error-boundary-widget.md)
- [ ] [029 — Injectable clock](02-foundation/029-clock-service.md)
- [ ] [030 — UUIDv7 identifier service](02-foundation/030-uuid-service.md)
- [ ] [031 — Hashing service](02-foundation/031-hashing-service.md)
- [ ] [032 — Isolate runner helper](02-foundation/032-isolate-runner.md)
- [ ] [033 — Device identity and profile bootstrap](02-foundation/033-device-identity.md)
- [ ] [034 — Connectivity service](02-foundation/034-connectivity-service.md)
- [ ] [035 — Runtime permissions service](02-foundation/035-permissions-service.md)
- [ ] [036 — Secure storage service](02-foundation/036-secure-storage-service.md)
- [ ] [037 — Lifecycle observer](02-foundation/037-app-lifecycle-observer.md)

## 03 — Design system

*Built before any feature. Every later screen is assembled from these parts and never invents its own.*

- [ ] [038 — Colour tokens for light and dark](03-design-system/038-color-tokens.md)
- [ ] [039 — Typography scale](03-design-system/039-typography-scale.md)
- [ ] [040 — Spacing, radius and size tokens](03-design-system/040-spacing-tokens.md)
- [ ] [041 — Elevation and surface treatment](03-design-system/041-elevation-tokens.md)
- [ ] [042 — Assemble the Material 3 theme](03-design-system/042-theme-assembly.md)
- [ ] [043 — High-contrast outdoor theme](03-design-system/043-outdoor-theme.md)
- [ ] [044 — Theme mode controller](03-design-system/044-theme-controller.md)
- [ ] [045 — Breakpoints and responsive helpers](03-design-system/045-breakpoints.md)
- [ ] [046 — Responsive layout builder](03-design-system/046-responsive-builder.md)
- [ ] [047 — Readable width constraint](03-design-system/047-content-constraint.md)
- [ ] [048 — Page scaffold](03-design-system/048-app-page.md)
- [ ] [049 — Buttons](03-design-system/049-app-button.md)
- [ ] [050 — Icon button](03-design-system/050-app-icon-button.md)
- [ ] [051 — Large primary action button](03-design-system/051-app-primary-action.md)
- [ ] [052 — Text field](03-design-system/052-app-text-field.md)
- [ ] [053 — Number field](03-design-system/053-app-number-field.md)
- [ ] [054 — Date, time and date-time field](03-design-system/054-app-date-field.md)
- [ ] [055 — Single choice field](03-design-system/055-app-choice-field.md)
- [ ] [056 — Multi-choice field](03-design-system/056-app-multi-choice-field.md)
- [ ] [057 — Switch and checkbox tiles](03-design-system/057-app-switch-tile.md)
- [ ] [058 — Search field](03-design-system/058-app-search-field.md)
- [ ] [059 — Chip and chip row](03-design-system/059-app-chip.md)
- [ ] [060 — Card](03-design-system/060-app-card.md)
- [ ] [061 — List tile](03-design-system/061-app-list-tile.md)
- [ ] [062 — Section header](03-design-system/062-app-section-header.md)
- [ ] [063 — Status pill and badge](03-design-system/063-app-status-pill.md)
- [ ] [064 — Empty state](03-design-system/064-app-empty-state.md)
- [ ] [065 — Error state](03-design-system/065-app-error-state.md)
- [ ] [066 — Loading and skeletons](03-design-system/066-app-loading-state.md)
- [ ] [067 — Async value view](03-design-system/067-async-value-view.md)
- [ ] [068 — Dialog service](03-design-system/068-app-dialog-service.md)
- [ ] [069 — Bottom sheet service](03-design-system/069-app-bottom-sheet.md)
- [ ] [070 — Snackbar and toast service](03-design-system/070-app-snackbar.md)
- [ ] [071 — Persistent banner](03-design-system/071-app-banner.md)
- [ ] [072 — Step progress list](03-design-system/072-app-progress-steps.md)
- [ ] [073 — Photo thumbnail](03-design-system/073-app-photo-thumb.md)
- [ ] [074 — Form scaffold and validation display](03-design-system/074-app-form-scaffold.md)
- [ ] [075 — Keyboard and focus utilities](03-design-system/075-keyboard-utils.md)
- [ ] [076 — Haptics service](03-design-system/076-haptics-service.md)
- [ ] [077 — User-facing copy helper](03-design-system/077-copy-helper.md)
- [ ] [078 — Widget gallery screen](03-design-system/078-widget-gallery.md)
- [ ] [079 — Golden test baselines for the catalogue](03-design-system/079-golden-baselines.md)

## 04 — Local database

*Every table, one task each, with the merge columns present from the first migration.*

- [ ] [080 — Drift database bootstrap](04-data-layer/080-drift-setup.md)
- [ ] [081 — Migration strategy and schema version](04-data-layer/081-migration-strategy.md)
- [ ] [082 — Shared column mixins](04-data-layer/082-column-mixins.md)
- [ ] [083 — DAO base and conventions](04-data-layer/083-dao-conventions.md)
- [ ] [084 — Transaction helper](04-data-layer/084-transaction-helper.md)
- [ ] [085 — Tombstones table](04-data-layer/085-tombstones-table.md)
- [ ] [086 — Audit log table](04-data-layer/086-audit-table.md)
- [ ] [087 — Device profile table](04-data-layer/087-device-profile-table.md)
- [ ] [088 — Projects table](04-data-layer/088-projects-table.md)
- [ ] [089 — Templates table](04-data-layer/089-templates-table.md)
- [ ] [090 — Template fields table](04-data-layer/090-template-fields-table.md)
- [ ] [091 — Template rows table](04-data-layer/091-template-rows-table.md)
- [ ] [092 — Context definition and state tables](04-data-layer/092-context-tables.md)
- [ ] [093 — Records table](04-data-layer/093-records-table.md)
- [ ] [094 — Record fields table](04-data-layer/094-record-fields-table.md)
- [ ] [095 — Photos table](04-data-layer/095-photos-table.md)
- [ ] [096 — Documents and audio tables](04-data-layer/096-documents-table.md)
- [ ] [097 — Captions table](04-data-layer/097-captions-table.md)
- [ ] [098 — Reference dataset tables](04-data-layer/098-reference-tables.md)
- [ ] [099 — Processing jobs and results tables](04-data-layer/099-jobs-table.md)
- [ ] [100 — Field evidence table](04-data-layer/100-evidence-table.md)
- [ ] [101 — Duplicates table](04-data-layer/101-duplicates-table.md)
- [ ] [102 — Variances table](04-data-layer/102-variances-table.md)
- [ ] [103 — Meeting tables](04-data-layer/103-meetings-tables.md)
- [ ] [104 — Exports table](04-data-layer/104-exports-table.md)
- [ ] [105 — Merge session and conflict tables](04-data-layer/105-merge-tables.md)
- [ ] [106 — Version vector table](04-data-layer/106-sync-state-table.md)
- [ ] [107 — Repository interfaces](04-data-layer/107-repository-interfaces.md)
- [ ] [108 — Test fixtures and object factories](04-data-layer/108-test-fixtures.md)
- [ ] [109 — Database integrity check](04-data-layer/109-db-integrity-check.md)
- [ ] [110 — Optional database encryption](04-data-layer/110-db-encryption.md)

## 05 — File storage

*The organised folder tree on the device, and every service that writes into it.*

- [ ] [111 — Storage root resolution](05-file-storage/111-storage-root.md)
- [ ] [112 — Project folder service](05-file-storage/112-project-folder-service.md)
- [ ] [113 — Path and name sanitiser](05-file-storage/113-path-sanitizer.md)
- [ ] [114 — Context-based photo path builder](05-file-storage/114-photo-path-builder.md)
- [ ] [115 — Safe file writer](05-file-storage/115-file-writer.md)
- [ ] [116 — Relocate files when context changes](05-file-storage/116-file-relocation.md)
- [ ] [117 — Thumbnail cache](05-file-storage/117-thumbnail-cache.md)
- [ ] [118 — Compressed upload copy](05-file-storage/118-compressed-copy.md)
- [ ] [119 — Cache cleanup](05-file-storage/119-cache-cleanup.md)
- [ ] [120 — Storage headroom guard](05-file-storage/120-storage-guard.md)
- [ ] [121 — Orphan file scanner](05-file-storage/121-orphan-scanner.md)
- [ ] [122 — Imported file validation](05-file-storage/122-file-validation.md)

## 06 — Application shell

*Navigation, the always-visible status line, and the frame every feature plugs into.*

- [ ] [123 — Router setup](06-app-shell/123-router-setup.md)
- [ ] [124 — Adaptive navigation shell](06-app-shell/124-nav-shell.md)
- [ ] [125 — Route guards](06-app-shell/125-route-guards.md)
- [ ] [126 — First-run flow](06-app-shell/126-first-run.md)
- [ ] [127 — Global status line](06-app-shell/127-status-line.md)
- [ ] [128 — Offline banner wiring](06-app-shell/128-offline-banner.md)
- [ ] [129 — Global error and crash recovery screen](06-app-shell/129-global-error-page.md)

## 07 — Operator profile and settings

*Local identity and the switches every later feature reads.*

- [ ] [130 — Operator profile](07-operator-and-settings/130-operator-profile.md)
- [ ] [131 — Settings screen shell](07-operator-and-settings/131-settings-shell.md)
- [ ] [132 — Settings store](07-operator-and-settings/132-settings-store.md)
- [ ] [133 — Capture settings screen](07-operator-and-settings/133-capture-settings.md)
- [ ] [134 — Storage settings screen](07-operator-and-settings/134-storage-settings.md)
- [ ] [135 — App lock with PIN](07-operator-and-settings/135-app-lock-pin.md)
- [ ] [136 — Biometric unlock](07-operator-and-settings/136-app-lock-biometric.md)
- [ ] [137 — Manual offline mode switch](07-operator-and-settings/137-offline-switch.md)
- [ ] [138 — About and licences](07-operator-and-settings/138-about-screen.md)

## 08 — Projects

*Create, open and manage the container that owns everything else.*

- [ ] [139 — Project domain model and repository](08-projects/139-project-model.md)
- [ ] [140 — Project list screen](08-projects/140-project-list.md)
- [ ] [141 — Create a project](08-projects/141-project-create.md)
- [ ] [142 — Open a project and current-project provider](08-projects/142-project-open.md)
- [ ] [143 — Project home screen](08-projects/143-project-home.md)
- [ ] [144 — Edit project details](08-projects/144-project-edit.md)
- [ ] [145 — Per-project settings](08-projects/145-project-settings.md)
- [ ] [146 — Archive and unarchive a project](08-projects/146-project-archive.md)
- [ ] [147 — Delete a project](08-projects/147-project-delete.md)
- [ ] [148 — Duplicate a project structure](08-projects/148-project-duplicate.md)

## 09 — Templates

*The definition of every record shape: shipped, built in the app, or read from a spreadsheet.*

- [ ] [149 — Template domain model and repository](09-templates/149-template-model.md)
- [ ] [150 — Field type registry](09-templates/150-field-type-registry.md)
- [ ] [151 — Shipped template assets](09-templates/151-shipped-templates-assets.md)
- [ ] [152 — Shipped template loader](09-templates/152-shipped-template-loader.md)
- [ ] [153 — Template list screen](09-templates/153-template-list.md)
- [ ] [154 — Create a template from the library](09-templates/154-template-create-from-shipped.md)
- [ ] [155 — Create a blank template](09-templates/155-template-create-blank.md)
- [ ] [156 — Duplicate a template](09-templates/156-template-duplicate.md)
- [ ] [157 — Field list editor](09-templates/157-field-list-editor.md)
- [ ] [158 — Add a field: label, type, required](09-templates/158-field-add-basic.md)
- [ ] [159 — Field advanced attributes](09-templates/159-field-advanced-attributes.md)
- [ ] [160 — Reorder fields](09-templates/160-field-reorder.md)
- [ ] [161 — Delete a field](09-templates/161-field-delete.md)
- [ ] [162 — Field validation rules editor](09-templates/162-field-validation-editor.md)
- [ ] [163 — Choice options editor](09-templates/163-field-options-editor.md)
- [ ] [164 — Identity field selection](09-templates/164-identity-fields.md)
- [ ] [165 — Output column mapping](09-templates/165-output-column-mapping.md)
- [ ] [166 — Template version bump](09-templates/166-template-versioning.md)
- [ ] [167 — Migrate records to a new template version](09-templates/167-template-migration-preview.md)
- [ ] [168 — Export a template as JSON](09-templates/168-template-export-json.md)
- [ ] [169 — Import a template from JSON](09-templates/169-template-import-json.md)
- [ ] [170 — Read a spreadsheet workbook](09-templates/170-xlsx-read-workbook.md)
- [ ] [171 — Detect the header row](09-templates/171-xlsx-header-detection.md)
- [ ] [172 — Infer field types from columns](09-templates/172-xlsx-type-inference.md)
- [ ] [173 — Confirm the column mapping](09-templates/173-xlsx-mapping-screen.md)
- [ ] [174 — Create a template from the mapping](09-templates/174-xlsx-template-create.md)
- [ ] [175 — Import predefined rows](09-templates/175-predefined-rows-import.md)
- [ ] [176 — Row alias editor](09-templates/176-row-aliases-editor.md)
- [ ] [177 — Predefined row checklist view](09-templates/177-checklist-progress.md)
- [ ] [178 — Detection profile editor](09-templates/178-template-detection-profile.md)

## 10 — Reference data and lookups

*Imported tables that prefill records and remove repeat typing.*

- [ ] [179 — Reference dataset model and repository](10-reference-data/179-dataset-model.md)
- [ ] [180 — Import a dataset from CSV](10-reference-data/180-dataset-import-csv.md)
- [ ] [181 — Import a dataset from a spreadsheet](10-reference-data/181-dataset-import-xlsx.md)
- [ ] [182 — Import a dataset from JSON](10-reference-data/182-dataset-import-json.md)
- [ ] [183 — Choose the key column](10-reference-data/183-dataset-key-selection.md)
- [ ] [184 — Dataset list screen](10-reference-data/184-dataset-list.md)
- [ ] [185 — Browse and search dataset rows](10-reference-data/185-dataset-browser.md)
- [ ] [186 — Edit a dataset row](10-reference-data/186-dataset-row-edit.md)
- [ ] [187 — Add a row from capture](10-reference-data/187-dataset-add-row.md)
- [ ] [188 — Configure a lookup field](10-reference-data/188-lookup-binding-config.md)
- [ ] [189 — Exact and case-insensitive matching](10-reference-data/189-lookup-exact-match.md)
- [ ] [190 — Fuzzy matching](10-reference-data/190-lookup-fuzzy-match.md)
- [ ] [191 — Multiple match picker](10-reference-data/191-lookup-multi-match.md)
- [ ] [192 — Apply a lookup prefill](10-reference-data/192-lookup-prefill-apply.md)
- [ ] [193 — Break the link on edit](10-reference-data/193-lookup-unlink.md)
- [ ] [194 — Export a dataset](10-reference-data/194-dataset-export.md)

## 11 — Context fields

*Set a value once, and it applies to every record until changed.*

- [ ] [195 — Context domain model and repository](11-context/195-context-model.md)
- [ ] [196 — Define the context hierarchy](11-context/196-context-hierarchy-editor.md)
- [ ] [197 — Persist and restore context](11-context/197-context-persistence.md)
- [ ] [198 — Context bar widget](11-context/198-context-bar.md)
- [ ] [199 — Context level picker](11-context/199-context-level-picker.md)
- [ ] [200 — Cascade clearing](11-context/200-context-cascade-clear.md)
- [ ] [201 — Apply context to a new record](11-context/201-context-apply-to-record.md)
- [ ] [202 — Per-record override](11-context/202-context-per-record-override.md)
- [ ] [203 — Pinned non-hierarchical fields](11-context/203-context-pinned-fields.md)
- [ ] [204 — Save a context preset](11-context/204-context-presets-save.md)
- [ ] [205 — Apply a context preset](11-context/205-context-presets-apply.md)
- [ ] [206 — Optional auto-clear timer](11-context/206-context-auto-clear.md)
- [ ] [207 — Optional movement prompt](11-context/207-context-gps-prompt.md)
- [ ] [208 — Wire context into the folder path](11-context/208-context-folder-wiring.md)

## 12 — Capture

*The heart of the app: evidence in, with as little typing as possible, always saved before anything else happens.*

- [ ] [209 — Capture session model](12-capture/209-capture-session-model.md)
- [ ] [210 — Capture session controller](12-capture/210-capture-session-controller.md)
- [ ] [211 — Capture screen shell](12-capture/211-capture-screen.md)
- [ ] [212 — Camera permission flow](12-capture/212-camera-permission-flow.md)
- [ ] [213 — Camera preview](12-capture/213-camera-preview.md)
- [ ] [214 — Shutter and immediate save](12-capture/214-camera-shutter.md)
- [ ] [215 — Flash, focus, zoom and grid](12-capture/215-camera-controls.md)
- [ ] [216 — Document mode with edge detection](12-capture/216-camera-document-mode.md)
- [ ] [217 — Pick photos from the gallery](12-capture/217-gallery-picker.md)
- [ ] [218 — Attach documents](12-capture/218-document-picker.md)
- [ ] [219 — Extract PDF pages as evidence](12-capture/219-pdf-page-extraction.md)
- [ ] [220 — Photo tray](12-capture/220-photo-tray.md)
- [ ] [221 — Full-screen photo viewer](12-capture/221-photo-viewer.md)
- [ ] [222 — Reorder photos](12-capture/222-photo-reorder.md)
- [ ] [223 — Delete a photo](12-capture/223-photo-delete.md)
- [ ] [224 — Retake a photo](12-capture/224-photo-retake.md)
- [ ] [225 — Rotate a photo](12-capture/225-photo-rotate.md)
- [ ] [226 — Crop a photo](12-capture/226-photo-crop.md)
- [ ] [227 — Assign a photo type](12-capture/227-photo-type-assign.md)
- [ ] [228 — Multi-select mode](12-capture/228-photo-multi-select.md)
- [ ] [229 — Move photos to another record](12-capture/229-photo-move-record.md)
- [ ] [230 — Record caption field](12-capture/230-record-caption.md)
- [ ] [231 — Per-photo caption](12-capture/231-photo-caption.md)
- [ ] [232 — Caption scope: this, selected, all](12-capture/232-caption-scope-selector.md)
- [ ] [233 — Append or replace](12-capture/233-caption-apply-mode.md)
- [ ] [234 — Microphone permission flow](12-capture/234-voice-permission.md)
- [ ] [235 — Speech-to-text service](12-capture/235-stt-service.md)
- [ ] [236 — Voice input button](12-capture/236-voice-input-button.md)
- [ ] [237 — Preserve the raw transcript](12-capture/237-transcript-preservation.md)
- [ ] [238 — Long-form audio recording](12-capture/238-audio-recording.md)
- [ ] [239 — Barcode and QR scanner](12-capture/239-barcode-scanner.md)
- [ ] [240 — Continuous scan mode](12-capture/240-barcode-continuous.md)
- [ ] [241 — Identifier-first lookup](12-capture/241-identifier-lookup.md)
- [ ] [242 — Automatic field application](12-capture/242-auto-fields.md)
- [ ] [243 — Per-project record numbering](12-capture/243-record-number-sequence.md)
- [ ] [244 — Optional GPS capture](12-capture/244-gps-capture.md)
- [ ] [245 — Inline template fields on capture](12-capture/245-inline-field-entry.md)
- [ ] [246 — Capture and analyse](12-capture/246-save-immediate.md)
- [ ] [247 — Save raw, analyse later](12-capture/247-save-raw.md)
- [ ] [248 — Reset for the next item](12-capture/248-capture-reset.md)
- [ ] [249 — Crash recovery for an unsaved session](12-capture/249-capture-recovery.md)
- [ ] [250 — Image quality warnings](12-capture/250-image-quality-check.md)
- [ ] [251 — Rapid capture mode](12-capture/251-rapid-mode.md)
- [ ] [252 — Storage guard in capture](12-capture/252-capture-storage-guard.md)
- [ ] [253 — Choose or pin a template](12-capture/253-template-pick-on-capture.md)

## 13 — Processing pipeline

*On-device first, online only when it earns its place, always resumable and always optional.*

- [ ] [254 — Processing job model and repository](13-processing/254-job-model.md)
- [ ] [255 — Queue service](13-processing/255-job-queue.md)
- [ ] [256 — Job runner](13-processing/256-job-runner.md)
- [ ] [257 — Retry and backoff](13-processing/257-job-retry.md)
- [ ] [258 — Image preprocessing](13-processing/258-image-preprocessing.md)
- [ ] [259 — On-device OCR](13-processing/259-ocr-on-device.md)
- [ ] [260 — Store OCR results](13-processing/260-ocr-result-store.md)
- [ ] [261 — Perceptual hash and duplicate image detection](13-processing/261-perceptual-hash.md)
- [ ] [262 — Identifier pattern extraction](13-processing/262-identifier-extraction.md)
- [ ] [263 — AI service interface](13-processing/263-ai-service-interface.md)
- [ ] [264 — Provider registry and selection](13-processing/264-provider-registry.md)
- [ ] [265 — API key entry](13-processing/265-api-key-entry.md)
- [ ] [266 — Test connection](13-processing/266-provider-test-connection.md)
- [ ] [267 — Data egress preview](13-processing/267-egress-preview.md)
- [ ] [268 — Build the extraction request](13-processing/268-extraction-request.md)
- [ ] [269 — Parse and validate the response](13-processing/269-response-parse.md)
- [ ] [270 — Repair and retry a bad response](13-processing/270-response-repair.md)
- [ ] [271 — Persist raw provider responses](13-processing/271-response-persist.md)
- [ ] [272 — Apply proposals to a record](13-processing/272-proposal-application.md)
- [ ] [273 — Template detection: local signals](13-processing/273-template-detection-heuristics.md)
- [ ] [274 — Template detection: model assist](13-processing/274-template-detection-model.md)
- [ ] [275 — Ask the operator which template](13-processing/275-template-detection-prompt.md)
- [ ] [276 — Normalise units and measures](13-processing/276-normalise-units.md)
- [ ] [277 — Normalise to choice options](13-processing/277-normalise-choices.md)
- [ ] [278 — Normalise dates and numbers](13-processing/278-normalise-dates.md)
- [ ] [279 — Match to a predefined row](13-processing/279-row-matching.md)
- [ ] [280 — Confidence bands](13-processing/280-confidence-banding.md)
- [ ] [281 — Link values to their evidence](13-processing/281-evidence-linking.md)
- [ ] [282 — Record provenance](13-processing/282-provenance-recording.md)
- [ ] [283 — Refine captions](13-processing/283-caption-refinement.md)
- [ ] [284 — No-invention enforcement](13-processing/284-no-invention-guard.md)
- [ ] [285 — Skip the online stage when possible](13-processing/285-skip-online-when-complete.md)
- [ ] [286 — Group images into one request](13-processing/286-batching-and-grouping.md)
- [ ] [287 — Budget guard and request counter](13-processing/287-cost-guard.md)
- [ ] [288 — Processing queue screen](13-processing/288-queue-screen.md)
- [ ] [289 — Process all and process selected](13-processing/289-process-actions.md)
- [ ] [290 — Failed jobs and retry](13-processing/290-failed-jobs-view.md)
- [ ] [291 — Automatic processing when connected](13-processing/291-auto-process-on-connect.md)
- [ ] [292 — Opportunistic on-device OCR](13-processing/292-background-ocr.md)
- [ ] [293 — Processing notifications](13-processing/293-processing-notifications.md)

## 14 — Review and approval

*Where a person turns proposals into data. Fast for the common case, thorough when needed.*

- [ ] [294 — Review screen](14-review/294-review-screen.md)
- [ ] [295 — Attention-first field ordering](14-review/295-attention-ordering.md)
- [ ] [296 — Edit a field inline](14-review/296-field-editor-inline.md)
- [ ] [297 — Raw and refined toggle](14-review/297-raw-refined-toggle.md)
- [ ] [298 — Evidence viewer](14-review/298-evidence-viewer.md)
- [ ] [299 — Confidence display](14-review/299-confidence-display.md)
- [ ] [300 — Not detected affordances](14-review/300-not-detected-affordance.md)
- [ ] [301 — Mark a field verified](14-review/301-verify-field.md)
- [ ] [302 — Approve and next](14-review/302-approve-record.md)
- [ ] [303 — Re-analyse a record](14-review/303-reanalyse-record.md)
- [ ] [304 — Batch review flow](14-review/304-batch-review.md)

## 15 — Records

*Find, read and change what has been captured, at any time after capture.*

- [ ] [305 — Record domain model and repository](15-records/305-record-model.md)
- [ ] [306 — Record status lifecycle](15-records/306-record-lifecycle.md)
- [ ] [307 — Records list screen](15-records/307-records-list.md)
- [ ] [308 — Search records](15-records/308-records-search.md)
- [ ] [309 — Filter records](15-records/309-records-filters.md)
- [ ] [310 — Sort records](15-records/310-records-sort.md)
- [ ] [311 — Record detail screen](15-records/311-record-detail.md)
- [ ] [312 — Edit a saved record's fields](15-records/312-record-edit-fields.md)
- [ ] [313 — Add and remove photos after save](15-records/313-record-photos-edit.md)
- [ ] [314 — Change a record's template](15-records/314-record-template-change.md)
- [ ] [315 — Record history view](15-records/315-record-history.md)
- [ ] [316 — Delete a record](15-records/316-record-delete.md)
- [ ] [317 — Recycle bin](15-records/317-recycle-bin.md)
- [ ] [318 — Retention purge job](15-records/318-purge-job.md)
- [ ] [319 — Bulk actions on records](15-records/319-record-bulk-actions.md)

## 16 — Validation, duplicates and verification

*The checks that make the output trustworthy, each with a human in the loop.*

- [ ] [320 — Validation engine](16-data-quality/320-validation-engine.md)
- [ ] [321 — Field validators](16-data-quality/321-field-validators.md)
- [ ] [322 — Record validators](16-data-quality/322-record-validators.md)
- [ ] [323 — Validation display](16-data-quality/323-validation-display.md)
- [ ] [324 — Identity hash computation](16-data-quality/324-identity-hash.md)
- [ ] [325 — Duplicate detection service](16-data-quality/325-duplicate-detection.md)
- [ ] [326 — Duplicate prompt on save](16-data-quality/326-duplicate-prompt.md)
- [ ] [327 — Duplicate comparison view](16-data-quality/327-duplicate-compare.md)
- [ ] [328 — Override an existing record](16-data-quality/328-duplicate-override.md)
- [ ] [329 — Merge fields between duplicates](16-data-quality/329-duplicate-merge-fields.md)
- [ ] [330 — Keep both and link](16-data-quality/330-duplicate-keep-both.md)
- [ ] [331 — Duplicates review screen](16-data-quality/331-duplicates-screen.md)
- [ ] [332 — Detect source conflicts](16-data-quality/332-source-conflict-detection.md)
- [ ] [333 — Resolve a source conflict](16-data-quality/333-source-conflict-ui.md)
- [ ] [334 — Verification mode switch](16-data-quality/334-verification-mode.md)
- [ ] [335 — Prefill from the register](16-data-quality/335-verification-prefill.md)
- [ ] [336 — Compute variance](16-data-quality/336-variance-computation.md)
- [ ] [337 — Variance screen](16-data-quality/337-variance-screen.md)
- [ ] [338 — Missing and not-found reporting](16-data-quality/338-missing-items.md)
- [ ] [339 — Project quality summary](16-data-quality/339-quality-summary.md)

## 17 — Meeting mode

*A meeting is a record with structure: minutes, attendance and actions.*

- [ ] [340 — Meeting template and model](17-meetings/340-meeting-template.md)
- [ ] [341 — Create a meeting](17-meetings/341-meeting-create.md)
- [ ] [342 — Agenda items editor](17-meetings/342-agenda-editor.md)
- [ ] [343 — Attendees editor](17-meetings/343-attendee-editor.md)
- [ ] [344 — Attendance sheet photo](17-meetings/344-attendance-photo.md)
- [ ] [345 — Read the attendance sheet](17-meetings/345-attendance-ocr.md)
- [ ] [346 — Match attendees to staff data](17-meetings/346-attendee-matching.md)
- [ ] [347 — Record the meeting](17-meetings/347-meeting-audio.md)
- [ ] [348 — Transcribe the recording](17-meetings/348-meeting-transcription.md)
- [ ] [349 — Refine the minutes](17-meetings/349-minutes-refinement.md)
- [ ] [350 — Decisions editor](17-meetings/350-decisions-editor.md)
- [ ] [351 — Action items editor](17-meetings/351-actions-editor.md)
- [ ] [352 — Meeting attachments](17-meetings/352-meeting-attachments.md)
- [ ] [353 — Meeting review and approval](17-meetings/353-meeting-review.md)

## 18 — Export

*Five formats, all produced on the device, all reproducible and all recorded.*

- [ ] [354 — Export request model](18-export/354-export-model.md)
- [ ] [355 — Export scope selection](18-export/355-export-scope.md)
- [ ] [356 — Column and extras options](18-export/356-export-options.md)
- [ ] [357 — Pre-export validation](18-export/357-export-validation-gate.md)
- [ ] [358 — Export value formatter](18-export/358-value-formatter.md)
- [ ] [359 — Photo naming service](18-export/359-photo-naming-service.md)
- [ ] [360 — Rename photos when identity is known](18-export/360-photo-rename-on-identity.md)
- [ ] [361 — XLSX writer core](18-export/361-xlsx-writer.md)
- [ ] [362 — Write into a copy of the original workbook](18-export/362-xlsx-template-copy.md)
- [ ] [363 — Write into predefined rows](18-export/363-xlsx-predefined-rows.md)
- [ ] [364 — Raw and refined column pairs](18-export/364-xlsx-raw-refined-columns.md)
- [ ] [365 — One sheet per template](18-export/365-xlsx-multi-sheet.md)
- [ ] [366 — Photo reference modes](18-export/366-xlsx-photo-references.md)
- [ ] [367 — Photo index sheet](18-export/367-photo-index-sheet.md)
- [ ] [368 — CSV writer](18-export/368-csv-writer.md)
- [ ] [369 — JSON writer](18-export/369-json-writer.md)
- [ ] [370 — Data dictionary writer](18-export/370-data-dictionary.md)
- [ ] [371 — PDF engine and shared layout](18-export/371-pdf-engine.md)
- [ ] [372 — Record report](18-export/372-pdf-record-report.md)
- [ ] [373 — Project summary report](18-export/373-pdf-summary-report.md)
- [ ] [374 — Variance report](18-export/374-pdf-variance-report.md)
- [ ] [375 — Meeting minutes PDF](18-export/375-pdf-minutes.md)
- [ ] [376 — ZIP data package](18-export/376-zip-package.md)
- [ ] [377 — Export manifest](18-export/377-export-manifest.md)
- [ ] [378 — Export screen](18-export/378-export-screen.md)
- [ ] [379 — Export progress and cancellation](18-export/379-export-progress.md)
- [ ] [380 — Export history](18-export/380-export-history.md)
- [ ] [381 — Export versioning and folders](18-export/381-export-versioning.md)
- [ ] [382 — Share an export](18-export/382-export-share.md)

## 19 — Bundles and merge

*Collaboration with no server: a project leaves whole and rejoins safely.*

- [ ] [383 — Bundle format and manifest model](19-bundles-and-merge/383-bundle-format.md)
- [ ] [384 — Bundle writer](19-bundles-and-merge/384-bundle-writer.md)
- [ ] [385 — Bundle scope options](19-bundles-and-merge/385-bundle-scope.md)
- [ ] [386 — Optional bundle encryption](19-bundles-and-merge/386-bundle-encryption.md)
- [ ] [387 — Exclude secrets from bundles](19-bundles-and-merge/387-bundle-secret-exclusion.md)
- [ ] [388 — Bundle reader and validation](19-bundles-and-merge/388-bundle-reader.md)
- [ ] [389 — Import as a new project](19-bundles-and-merge/389-bundle-import-new.md)
- [ ] [390 — Version vector service](19-bundles-and-merge/390-version-vector-service.md)
- [ ] [391 — Tombstone propagation](19-bundles-and-merge/391-tombstone-merge.md)
- [ ] [392 — Entity-level merge](19-bundles-and-merge/392-merge-entity-level.md)
- [ ] [393 — Field-level merge](19-bundles-and-merge/393-merge-field-level.md)
- [ ] [394 — Automatic settlement rules](19-bundles-and-merge/394-merge-auto-rules.md)
- [ ] [395 — Merge photos by content hash](19-bundles-and-merge/395-merge-photos.md)
- [ ] [396 — Merge templates](19-bundles-and-merge/396-merge-templates.md)
- [ ] [397 — Merge reference datasets](19-bundles-and-merge/397-merge-reference.md)
- [ ] [398 — Relabel colliding record numbers](19-bundles-and-merge/398-merge-record-numbers.md)
- [ ] [399 — Merge preview screen](19-bundles-and-merge/399-merge-preview.md)
- [ ] [400 — Conflict resolution screen](19-bundles-and-merge/400-conflict-screen.md)
- [ ] [401 — Bulk conflict resolution](19-bundles-and-merge/401-conflict-bulk.md)
- [ ] [402 — Apply the merge atomically](19-bundles-and-merge/402-merge-apply.md)
- [ ] [403 — Merge history](19-bundles-and-merge/403-merge-history.md)
- [ ] [404 — Undo a merge](19-bundles-and-merge/404-merge-undo.md)
- [ ] [405 — Post-merge duplicate scan](19-bundles-and-merge/405-post-merge-duplicates.md)
- [ ] [406 — Share and receive bundles](19-bundles-and-merge/406-bundle-share.md)

## 20 — Importing existing data

*Continue an inventory someone else started, as records or as a register to verify against.*

- [ ] [407 — Import entry point](20-data-import/407-import-entry.md)
- [ ] [408 — Map spreadsheet columns to template fields](20-data-import/408-import-records-mapping.md)
- [ ] [409 — Create records from rows](20-data-import/409-import-records-create.md)
- [ ] [410 — Duplicate check during import](20-data-import/410-import-duplicate-check.md)
- [ ] [411 — Import summary](20-data-import/411-import-summary.md)
- [ ] [412 — Import as a verification register](20-data-import/412-import-as-register.md)

## 21 — Manual cloud upload

*A destination for files the user chooses to send. Never automatic, never a sync channel.*

- [ ] [413 — Cloud destination model](21-cloud-upload/413-destination-model.md)
- [ ] [414 — Destinations screen](21-cloud-upload/414-destination-list.md)
- [ ] [415 — Amazon S3 and compatible stores](21-cloud-upload/415-destination-s3.md)
- [ ] [416 — Google Drive](21-cloud-upload/416-destination-google-drive.md)
- [ ] [417 — OneDrive and Dropbox](21-cloud-upload/417-destination-onedrive-dropbox.md)
- [ ] [418 — WebDAV and generic HTTPS](21-cloud-upload/418-destination-webdav.md)
- [ ] [419 — Local or removable folder](21-cloud-upload/419-destination-local-folder.md)
- [ ] [420 — Upload confirmation](21-cloud-upload/420-upload-confirm.md)
- [ ] [421 — Upload with progress and resume](21-cloud-upload/421-upload-runner.md)
- [ ] [422 — Upload history](21-cloud-upload/422-upload-history.md)
- [ ] [423 — Remove a destination](21-cloud-upload/423-destination-remove.md)

## 22 — Privacy and security

*The controls that decide what leaves the device and what is visible in it.*

- [ ] [424 — What leaves this device](22-privacy-and-security/424-egress-summary-screen.md)
- [ ] [425 — Disable AI per project](22-privacy-and-security/425-ai-disable-per-project.md)
- [ ] [426 — Do not send images](22-privacy-and-security/426-do-not-send-images.md)
- [ ] [427 — Consent flag for personal data](22-privacy-and-security/427-consent-flag.md)
- [ ] [428 — Face blurring on export](22-privacy-and-security/428-face-blur-export.md)
- [ ] [429 — Redact regions before sending](22-privacy-and-security/429-redaction-before-send.md)
- [ ] [430 — GPS consent and control](22-privacy-and-security/430-gps-privacy.md)
- [ ] [431 — Treat imported text as data](22-privacy-and-security/431-untrusted-text-handling.md)
- [ ] [432 — Automated secret leak test](22-privacy-and-security/432-secret-scan-test.md)
- [ ] [433 — Permission minimisation review](22-privacy-and-security/433-permission-minimisation.md)

## 23 — Hardening

*Making the finished app fast, legible, reachable and unbreakable in the field.*

- [ ] [434 — Responsive audit](23-hardening/434-responsive-audit.md)
- [ ] [435 — Landscape and foldables](23-hardening/435-orientation-support.md)
- [ ] [436 — Accessibility audit](23-hardening/436-accessibility-audit.md)
- [ ] [437 — Large text audit](23-hardening/437-text-scale-audit.md)
- [ ] [438 — Copy and message review](23-hardening/438-copy-review.md)
- [ ] [439 — Empty and first-use states](23-hardening/439-empty-states-review.md)
- [ ] [440 — List and image performance](23-hardening/440-list-performance.md)
- [ ] [441 — Database index review](23-hardening/441-db-index-review.md)
- [ ] [442 — Cold start optimisation](23-hardening/442-cold-start.md)
- [ ] [443 — Memory and leak review](23-hardening/443-memory-review.md)
- [ ] [444 — Battery and background behaviour](23-hardening/444-battery-review.md)
- [ ] [445 — Failure-path review](23-hardening/445-error-recovery-review.md)
- [ ] [446 — Localisation scaffolding](23-hardening/446-localisation-scaffold.md)
- [ ] [447 — App icon, splash and store branding](23-hardening/447-branding-assets.md)
- [ ] [448 — Device matrix testing](23-hardening/448-device-matrix-testing.md)
- [ ] [449 — Structured field trial](23-hardening/449-field-trial.md)

## 24 — Testing and release

*The suites, the pipeline and the checks that make a build shippable.*

- [ ] [450 — Unit test harness](24-testing-and-release/450-test-harness-unit.md)
- [ ] [451 — Widget test harness](24-testing-and-release/451-test-harness-widget.md)
- [ ] [452 — Integration test harness](24-testing-and-release/452-test-harness-integration.md)
- [ ] [453 — End-to-end: capture to export](24-testing-and-release/453-e2e-capture-to-export.md)
- [ ] [454 — End-to-end: offline and deferred](24-testing-and-release/454-e2e-offline-deferred.md)
- [ ] [455 — End-to-end: context inheritance](24-testing-and-release/455-e2e-context-inheritance.md)
- [ ] [456 — End-to-end: caption scope](24-testing-and-release/456-e2e-caption-scope.md)
- [ ] [457 — End-to-end: known asset verification](24-testing-and-release/457-e2e-known-asset.md)
- [ ] [458 — End-to-end: duplicate override](24-testing-and-release/458-e2e-duplicate-override.md)
- [ ] [459 — End-to-end: bundle merge](24-testing-and-release/459-e2e-merge.md)
- [ ] [460 — End-to-end: meeting](24-testing-and-release/460-e2e-meeting.md)
- [ ] [461 — End-to-end: every export format](24-testing-and-release/461-e2e-export-formats.md)
- [ ] [462 — Continuous integration pipeline](24-testing-and-release/462-ci-pipeline.md)
- [ ] [463 — Integration tests in the pipeline](24-testing-and-release/463-ci-integration-job.md)
- [ ] [464 — Release build configuration](24-testing-and-release/464-release-build.md)
- [ ] [465 — Release checklist](24-testing-and-release/465-release-checklist.md)
- [ ] [466 — Post-release backlog](24-testing-and-release/466-post-release-backlog.md)
