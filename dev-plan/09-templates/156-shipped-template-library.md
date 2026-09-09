# 156 — Author the shipped template library

**Phase** 09 · Templates  |  **Depends on** [155](155-shipped-templates-assets.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The twenty-three shipped templates of specification §13.4 and §13.5, as JSON assets that pass the checker from 155,
plus the four field groups every one of them inherits.

## Files

- `frontend/assets/templates/_groups.json` (new)
- `frontend/assets/templates/*.json` (new — one per template, named by `template_key`)

## Steps

1. Write `_groups.json` with the four inherited groups of §13.3: `record_admin`, `location_context`, `evidence`,
   `review`. Every template references them by name rather than repeating their fields.
2. Author one asset per template, transcribing §13.5 exactly — field keys, types, groups, choice lists, identity
   keys and child rows:

   ```text
   equipment_asset      medical_equipment    ict_equipment       vehicle_plant      furniture_fitting
   building_facility    room_space           utility_point       stock_item         inspection_check
   work_order           meter_reading        person_beneficiary  staff_member       household_survey
   land_parcel          plant_tree           livestock_animal    document_record    meeting
   event_activity       incident_report      generic_item
   ```

3. Mark `medical_equipment`, `ict_equipment`, `vehicle_plant` and `furniture_fitting` as deriving from
   `equipment_asset`, so the columns they share keep the same keys and export into the same columns.
4. Set `required` from the §13.5 markers: `*` becomes `REQUIRED`, `+` becomes `RECOMMENDED`, everything else
   `OPTIONAL`. Keep the required set small enough that a first capture is never blocked (§13.2).
5. Give `meeting` its child rows — agenda item, attendee, apology, decision, action item — rather than flattening
   them into columns.
6. Declare `identity_fields` per template exactly as §13.5 lists them.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Every label is a localisation key, not an English string baked into the asset.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] All twenty-three templates exist, and `dart run tool/check_templates.dart` is green on every one of them.
- [ ] No template repeats a field that belongs to an inherited group.
- [ ] The four derived templates reuse their parent's keys rather than inventing near-duplicates.
- [ ] `generic_item` has ten columns and one required field, so capture can start before the shape is decided.
- [ ] Tests written and passing: a test that every asset parses, validates against `_schema.json`, and resolves its inherited groups and identity keys.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- The runtime loader — that is 157.
- Letting a user change requiredness — that is 165.
- Anything not named above. Raise it as its own task rather than widening this one.
