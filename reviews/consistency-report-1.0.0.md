# HL7 Europe Common Cancer Model – Consistency Review for 1.0.0 (STU 1)

- **Date:** 2026-10-20. First review. Fixed items are removed from their sections and listed under *Fixed since the first review* at the end of the report.
- **Scope:** FSH sources (`input/fsh`), narrative pages (`input/pagecontent`, `input/includes`), configuration (`sushi-config.yaml`, `publication-request.json`, `ig.ini`), examples, the latest IG Publisher QA output (`output/qa.*`) and `input/ignoreWarnings.txt`.
- **Target:** the post-ballot STU 1 publication (1.0.0, trial-use). `1.0.0-ballot` was published on 2026-06-14 (`http://hl7.eu/fhir/cancer-common/package-list.json`).
- **Build status:**
  - No SUSHI log is kept in the repository, so SUSHI errors and warnings were not checked.
  - The IG Publisher 3.0.1 run of 2026-10-20 14:19 was built as `hl7.fhir.eu.cancer-common#1.0.0-ballot`, status `active`, release label `ballot`, and includes all commits up to `d5cb5c5` (branch `FHIR-57997`). The working copy only differs in line endings of `FHIR-eu-cancer-common.xml`. The build is current, but not built with the target version.
  - It reports **31 errors, 311 warnings and 14 information messages**, plus 23 suppressed warnings and 34 suppressed hints.

Severity: **High** means fix before publication. **Medium** means it should be fixed for 1.0.0. **Low** means cleanup or editorial.

File references are relative to the repository root. Line numbers are those of the current working copy.

Each open item has an id `<section>-<n>` (e.g. `3.1-2`). Ids are stable: fixed or accepted items keep their id when they move to *Won't fix (accepted)* or *Fixed since the first review*, and new items get the next free number.

---

## 1. Release blockers (High)

| ID | Area | Finding | Fix |
|---|---|---|---|
| 1-1 | Configuration | `sushi-config.yaml` and `publication-request.json` still describe the ballot: `version: 1.0.0-ballot`, `releaseLabel: ballot`, `"status": "ballot"`, `"first": true`, path `.../1.0.0-ballot`, desc "first ballot". QA: "Version 1.0.0-ballot has already been published … first must not be true". | Set version `1.0.0`, `releaseLabel: STU 1` (or `trial-use`), publication-request `status: trial-use`, `first: false`, `path: http://hl7.eu/fhir/cancer-common/1.0.0`, new `desc`. Keep `sequence: STU 1`, `mode: milestone`. |
| 1-2 | Pages | `input/pagecontent/designchoices.md` contains only *Lorem ipsum*. It is in the `pages` list, so it is published (not in the menu). | Write the page or remove it from `sushi-config.yaml` and delete the file. |
| 1-3 | Logical model | `CancerStage` invariants `cs-ev-e1` and `cs-ev-e2` say the opposite of the model: "If type is Clinical, imaging evidence must not be provided" / "If type is Pathological, surgery evidence must not be provided". The definition, `evidenceReference ^comment` and `logicalmodels.md:64` say a clinical stage is based on imaging and a pathological stage on surgery. The clinical example references `Imaging1-Example`, so it breaks the published constraint text. | Swap the evidence types in both descriptions (Clinical → no surgery evidence; Pathological → no imaging evidence), see 3.2-1. |
| 1-4 | QA | 31 errors: 28 unresolved references between logical-model examples, and 3 heading errors in `journey.md`. Errors cannot be hidden by `ignoreWarnings.txt`. | See §7 (7-1, 7-2). |

---

## 2. Configuration and publication

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 2-1 | Medium | `sushi-config.yaml:11` | `license` is commented out; the ImplementationGuide has no license. | Set `license: CC0-1.0`. |
| 2-2 | Medium | `sushi-config.yaml:18` | Copyright text says "Common Creative License (CC0 1.0)". The licence is *Creative Commons* CC0 1.0. | "HL7 Europe. Licensed under Creative Commons CC0 1.0. Details at [Copyright](copyright.html)." |
| 2-3 | Medium | `sushi-config.yaml:25` | `hl7.fhir.eu.base: 2.0.0`; QA warns that 2.0.1 is available. | Move to 2.0.1 and rebuild, or explain in `knownissues.md` why 2.0.0 is kept. |
| 2-4 | Low | `sushi-config.yaml` | `hl7.terminology.r4` is not pinned; this build resolved 7.4.0. | Pin `hl7.terminology.r4: 7.4.0` (or the version used at publication). |
| 2-5 | Medium | `sushi-config.yaml:27` | Dependency on the US realm `hl7.fhir.us.mcode: 4.0.0`, used only by the informative comorbidity profile (two extensions). | Keep it and say so on the dependencies or known-issues page, or drop the profile from this release. |
| 2-6 | Medium | `fsh-generated/resources/StructureDefinition-*.json` | The 11 logical models have no FMM or standards-status extension; only the two informative profiles have them (`SetFmmandStatusRule (0, informative)`). For an STU, the normative content of the guide should state its maturity. | Add `* insert SetFmmandStatusRule (1, trial-use)` (or the agreed FMM) to each logical model. |
| 2-8 | Low | `sushi-config.yaml:9` | `copyrightYear: 2023+`. Check the year the work started; the first publication is 2026. | Confirm or change to the right start year. |
| 2-9 | Low | `sushi-config.yaml:2`, rest of file | Template leftovers: `# check if this may create issues` on `canonical`, ~200 lines of commented SUSHI template help, commented `menu`, `groups` and `dependencies` blocks. | Remove the comments. |
| 2-10 | Low | `sushi-config.yaml` | No `groups`: the Artifacts page uses the default grouping, mixing logical models, informative profiles and the Parameters resource. | Add groups (Logical models; Informative FHIR profiles; Terminology support; Examples). |
| 2-11 | Low | `FHIR-eu-cancer-common.xml` | Jira spec file is up to date with the artifacts. It only has uncommitted line-ending changes. The Publisher will add the `1.0.0` version at release. | Commit after the 1.0.0 build. |
| 2-12 | Low | `ig.ini:5`, `phoenix-template/` | **To do (after 1.0.0):** the local `phoenix-template` is kept for this release (2-7). The guide should later move to the multi-language version of the HL7 Europe template. | Switch `template` in `ig.ini` to the multi-language HL7 Europe template, then remove `phoenix-template/` and re-check the menu, header and the `maturity-gray` styling in `menu.xml`. |

---

## 3. Profiles (FSH)

### 3.1 References between logical models

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 3.1-1 | Medium | `input/fsh/models/ActiveSurveillance.fsh:8` | `subject 1..1 CancerPatient`: the patient is embedded as a type, not referenced. All other models use `Reference(CancerPatient)`. | `* subject 1..1 Reference(CancerPatient) "Subject"`. |
| 3.1-2 | Medium | `input/fsh/models/CancerStage.fsh:28`, `:30` | `evidenceReference 0..*`, but the comment says "It shall be present". | Make it `1..*`, or change the comment to "should". |
| 3.1-3 | Medium | `input/fsh/models/Imaging.fsh` | `Imaging` has only `type` and `bodySite`: no subject, no date, no link to the condition. `CancerConditionAtDiagnosis.imagingDate` and `CancerStage.evidenceReference` rely on it. | Confirm this is intended and say it in the model description, or add `subject` and `date`. |
| 3.1-4 | Low | `input/fsh/models/*.fsh` | Short labels for the same element differ: "CancerCondition AtDiagnosis Reference" (5 models), "CancerConditionAtDiagnosisReference" (2), "CancerConditionReference" (`ClinicalCancerProgression.fsh:9`); typo "ClinicalCancerProgresionReference" (`Radiotherapy.fsh:12`, `SystemicTreatment.fsh:13`); "ObservedSex Gender" (`CancerPatient.fsh:13`). | Use one form, e.g. "CancerConditionAtDiagnosisReference", "ClinicalCancerProgressionReference", "ObservedSexGender". |

### 3.2 Invariants

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 3.2-1 | High | `input/fsh/models/CancerStage.fsh:38-47` | Descriptions of `cs-ev-e1` / `cs-ev-e2` are inverted (see 1-3). Both have no expression, which produces the eld-21 warnings (7-4). The commented expressions are inverted too. | Fix the descriptions. Optionally add computable expressions, e.g. `type.text = 'Clinical' implies evidenceReference.all(reference.contains('/Imaging/'))`. |
| 3.2-2 | Medium | `input/fsh/models/SystemicTreatment.fsh:34-36` | `st-1` description: "if endDate is not present, ongoing must be true". The expression checks the reverse (endDate present → ongoing not true). The rule in the description is not enforced. | Expression: `(ongoing = true implies endDate.empty()) and (endDate.empty() implies ongoing = true)`, or change the description. |
| 3.2-3 | Medium | `input/fsh/models/SystemicTreatment.fsh:38-40` | `st-2` description says "greater than or equal to"; expression uses `>`. A one-day treatment fails. | Use `>=`, as in `as-1` and `rt-1`. |
| 3.2-4 | Low | `ActiveSurveillance.fsh:20-22`, `Radiotherapy.fsh:30-32`, `SystemicTreatment.fsh:37-39` | The same end ≥ start rule is `#error` with "must" in `as-1`, `#warning` with "should" in `rt-1` and `st-2`. | Use one severity and verb. |
| 3.2-5 | Low | `CancerStage.fsh`, `LastFollowUp.fsh`, `ClinicalCancerProgression.fsh` | Invariants test free text (`type.text = 'Clinical'`, `vitalStatus.where(text = 'Alive')`, `classificationType.text = 'TNM'`) in some models and `coding.code` in others (`ccp-1`, `ccp-2`). A coded value without the exact text passes. | Use one approach, and document the expected codes or texts in the element comments. |
| 3.2-6 | Low | `input/fsh/models/LastFollowUp.fsh:40` | `lfu-4` (no deathDate if Alive) is already covered by `lfu-3` (deathDate only if Dead). | Remove `lfu-4` or say why it is kept. |
| 3.2-7 | Low | `input/fsh/models/*.fsh` | Invariant ids follow several patterns: `as-1`, `ccad-1`, `cs-ev-e1`, `cs-tnm-1`, `cs-nontnm-1`, `lfu-1`, `recordedSexOrGender-or-gender`. `cs-tnm-1` description: "3 values is expected". | One pattern (`<model>-<n>`); "three values are expected". Changing ids after ballot is optional. |

### 3.3 Leftovers in FSH

- **[3.3-1]** **TODO comments:** `input/fsh/alias-systems.fsh:17` and `:23` ("to be checked"). Both aliases are unused.
- **[3.3-2]** **Commented-out blocks:** `CancerStage.fsh:32-35` (old `surgeryReference` / `imagingReference`), `observation-comorbidity-eu-ccm.fsh:15-21`, `:34-36`, `:41-43` (focus and value-set bindings to I4RC value sets), `rulesSet-common.fsh:15`, `:26-27`, `:58-59`, `:75-77`, `alias-extensions.fsh:3`, `:24`, `alias-ig.fsh:45`.
- **[3.3-3]** **Unused rulesets:** 16 of 17 rulesets in `input/fsh/rulesSet/rulesSet-common.fsh` are unused (Composition section rules, copyright rules, obligation rules from other IGs). Only `SetFmmandStatusRule` is used.
- **[3.3-4]** **Aliases:** 128 of 138 unused, mostly copied from IPS, EU Lab and EPS (`$Composition-uv-ips`, `$specimen-*-r5`, `$v3-*`…). Several point to R5 extensions no longer in the dependencies.
- **[3.3-5]** **Profile texts:**
  - `observation-comorbidity-eu-ccm.fsh:8`: "This profiles is adapted from the mCode…" → "This profile is adapted from mCODE".
  - `patient-eu-ccm.fsh:20`: empty rule `* extension[recordedSexOrGender]`.
  - `patient-eu-ccm.fsh:34`: "use as possible the extensions" → "use the extensions where possible".
  - `CancerPatient.fsh:15`: "changed respect the SexAtBirth" → "different from SexAtBirth".
  - `CancerConditionAtDiagnosis.fsh:12`, `:15`: "ICD03" → "ICD-O-3".
  - `ActiveSurveillance.fsh:17`: "surveillanceis".
  - `SystemicTreatment.fsh:28`: "it must be indicates as True" → "it must be set to true".
  - `ClinicalCancerProgression.fsh:4`: double space before "(sheet".
- **[3.3-6]** **Titles:** two logical models have spaced titles ("Cancer Patient", "Active Surveillance"), nine use the class name ("CancerStage", "LastFollowUp"…). Profiles use "Observation: Comorbidities" and "Patient (CCM)". Pick one style per artifact type.

### 3.4 Terminology

- **[3.4-1]** No value sets or bindings: all coded elements of the logical models are unbound `CodeableConcept`. Allowed values are only in comments ("Choice: Male | Female | Unknown | Other", "Clinical | Pathological"). This is acceptable for a logical model, but should be stated in `knownissues.md` (6.6-1).
- **[3.4-2]** Examples use codings without `system` (e.g. `type.coding[0].code = #Clinical`), hidden by the suppression at `ignoreWarnings.txt:9`. Fine while there are no code systems; document it with 3.4-1.

---

## 4. Obligation profiles

The guide has no obligation profiles and no actors. Nothing to check. The two FHIR profiles are informative (FMM 0).

---

## 5. Examples

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 5-1 | Medium | `input/fsh/examples/` | No example for `ActiveSurveillance`. All other 10 logical models have at least one. | Add `ActiveSurveillance1-Example` (it can stand outside the journey example). |
| 5-2 | Low | `input/fsh/examples/ObservationComorbidityExample.fsh:1`, `:18`, `:33` | `ComorbidityObservation1-Example`, `Patient1-Example`, `Practitioner1-Example` have no `Title`; all others do. The Jira spec file lists the first one by id. | Add titles in the same pattern ("Comorbidity Observation Example"…). |
| 5-3 | Low | `ObservationComorbidityExample.fsh:18`, `1-CancerPatient.fsh` | Two unrelated example patients: `Patient1-Example` (FHIR, John Doe, 1965) and `CancerPatient1-Example` (logical). | Optionally align the FHIR patient with the logical example patient. |
| 5-4 | Low | `ObservationComorbidityExample.fsh` | Three instances in one file named after one of them; logical examples use one file per instance with a step prefix. | Split, or rename the file. |

---

## 6. Narrative pages

### 6.1 `changes.md`

| ID | Sev | Line | Finding → Proposed |
|---|---|---|---|
| 6.1-1 | Medium | – | There is no change log page. After a ballot, STU 1 should list the changes made in ballot reconciliation (e.g. FHIR-57997, FHIR-58005, FHIR-58031, FHIR-58124) → add `changes.md` with a section per version and link it from the About menu. Usually written last. |

### 6.2 Stale ballot or preview wording

| ID | Location | Original | Proposed |
|---|---|---|---|
| 6.2-1 | `fhirmap-*.xml:18`, `omopmap-*.xml:18` (22 pages) | "In this ballot publication, some row/cells of the mapping table have been left in yellow…" | "In this publication, some rows or cells of the mapping table are highlighted in yellow…" |
| 6.2-2 | `index.md:6`, `scope.md:6`, `background.md:4`, `challenges.md:4`, `references.md:4` | "…not itself a model artefact or an implementation specification submitted for evaluation." | "…not itself a model artefact or an implementation specification." |
| 6.2-3 | `index.md:32` | "The **Functional** and **Logical** sections contain the proposed model content for review and evaluation in this publication." | "The **Functional** and **Logical** sections contain the model content of this publication." |
| 6.2-4 | `knownissues.md:3` | "This publication represents an initial, intentionally limited version…" | Keep, but check it still fits STU 1 after the ballot. |
| 6.2-5 | `fhirmap-*.xml`, `omopmap-*.xml`, `fhirmodelmap.xml`, `omopmodelmap.xml` | 20 of 22 mapping pages have only "FHIR Resource (TBD)" / "OMOP (TBD)" and "Mapping to be defined." rows. Only CancerPatient is mapped. | Remove the empty pages from this release, or keep them and say on the model-map pages that only CancerPatient is mapped in 1.0.0. |

### 6.3 Broken or inconsistent links

| ID | Sev | Location | Finding → Fix |
|---|---|---|---|
| – | – | – | QA reports 0 broken links. No `file://`, `build.fhir.org` or `/current/` links in the pages. No open items. |

### 6.4 Content inconsistencies

| ID | Sev | Location | Finding → Proposed |
|---|---|---|---|
| 6.4-1 | Medium | `glossary.xml:384-386` | Response list under ClinicalCancerProgression still has the errors fixed elsewhere by FHIR-58124: "the cancer is grown respect the previous Visit", "shrunk respect" → "the cancer has grown / has not grown or shrunk / has shrunk compared to the previous Visit". |
| 6.4-2 | Medium | `input/images-source/journey-example-diagnosis.plantuml:24`, `:30` | "Tumor Linphonode Metastasis" in the rendered example diagram → "Tumour, Node, Metastasis", as in the glossary. |
| 6.4-3 | Medium | `glossary.xml:42-44` | Glossary: CancerConditionAtDiagnosis "must have" a HistologyBehaviour, and "All attributes never change". Logical model: `histologyBehaviour 0..1` (may be missing during work-up), and the tumour grade "may evolve over time" → align the glossary with the logical model. |
| 6.4-4 | Medium | `scope.md:24` | "The HL7 FHIR representation of the model, expressed through profiles and related artefacts" is listed as content, but the profiles are informative and FMM 0 (`index.md:28-32`) → add "informative, initial" to the bullet. |
| 6.4-5 | Low | `index.md`, `scope.md` | Both pages have a "Scope" section with nearly the same text but different wording ("progressively extended over time" / "adopted across different implementations") → keep one and link to it. |
| 6.4-6 | Low | `input/includes/menu.xml` | Menu labels differ from page titles: "References" / "Source and Additional Information", "Logical Model" / "Logical Models", "Cancer Patient Journey" / "The Cancer Patient Journey", "Data Evolution" / "Data Evolution in the Cancer Journey", "Download" / "Downloads" → align one or the other. |

### 6.5 Language and editorial conventions

- **[6.5-1]** **Spelling.** British English is used throughout, except in the hidden block of `journey.md` ("behavior", "organization", lines 116, 118), which disappears with 6.5-4, and "Organizations" in `scope.md:23`. ("center"/"color" counts are CSS.)
- **[6.5-2]** **Naming.** The guide is called "HL7 Europe Common Cancer Model" (IG title), "HL7 Europe Cancer Common Data Model (ECCDM)" (pages) and "Common Cancer Data Model" (`publication-request.json:7`). The profile cites "mCode"; the page cites "mCODE". Use one name for the guide and "mCODE".
- **[6.5-3]** **Headings.** `journey.md:1`, `:9`, `:55` use `##` (line 1 with a tab). The other pages start at `###`. This causes the three QA errors (7-2).
- **[6.5-4]** **Markup.**
  - `journey.md:101-160` is a 60-line HTML comment (old "Data Collection per step" content). Remove it.
  - `glossary.xml:28-36` has a `<style>` element inside `<tbody>`, which is invalid HTML. Move it before the table.
  - `glossary.xml:3` and every `fhirmap-*`/`omopmap-*` page start with an empty `<a>  </a>` and empty `<p>` elements.
  - The mapping pages also carry document-level tags (`<title>`) inside the page fragment.
  - `conceptualmodel.md`, `dependencies.md`, `designchoices.md`, `journey-data-evolution.md` and `journey-example.md` have no trailing newline.

### 6.6 `knownissues.md`: suggested additions

- **[6.6-1]** No value sets or code systems are defined; coded attributes are unbound and examples use text or system-less codes (3.4-1, 3.4-2).
- **[6.6-2]** References between logical-model example instances cannot be resolved by the validator (if 7-1 is not fixed).
- **[6.6-3]** Only the CancerPatient mappings to FHIR and OMOP are filled in; other mapping pages are placeholders (6.2-5).
- **[6.6-4]** The informative comorbidity profile depends on extensions from the US mCODE IG (2-5).

---

## 7. QA output and `ignoreWarnings.txt`

This section is based on the IG Publisher 3.0.1 run of 2026-10-20 14:19, built as `1.0.0-ballot` / `active` / `ballot`.

**Visible messages:** 31 errors, 311 warnings and 14 information messages.

| ID | Message | Resources | Fix |
|---|---|---|---|
| 7-1 | ERROR (28) "Unable to resolve resource with reference 'http://hl7.eu/fhir/cancer-common/StructureDefinition/CancerPatient/CancerPatient1-Example'" and similar | All `Binary/*-Example` logical instances except CancerPatient1 and Imaging1 | The references are generated as `<logical-model URL>/<id>`, which the validator cannot resolve. `ignoreWarnings.txt:6` does not hide errors. Try plain relative references (`* subject.reference = "CancerPatient/CancerPatient1-Example"`) or `Reference(Binary/...)`. If none resolves, record it in `knownissues.md` (6.6-2) and in the publication request notes. |
| 7-2 | ERROR (3) "The page has more than one top level heading" | `journey.html` | Change `##` to `###` in `journey.md:1`, `:9`, `:55` (6.5-3). |
| 7-3 | WARNING (294) "duplicate element ids: project-nav" and (8) "searchform.html is not well formed" | All pages | Caused by the local template (2-7, accepted): `phoenix-template/includes/fragment-header.html:8` and `:11` both define `id="project-nav"`. Remove the duplicate `div` to clear 294 warnings; the `searchform.html` warnings go away with the template change (2-12). |
| 7-4 | WARNING (4) "Constraint failed: eld-21 … at CancerStage" | `StructureDefinition/CancerStage` | Add expressions to `cs-ev-e1`/`cs-ev-e2` (3.2-1), or fix the suppression (7-6). |
| 7-5 | WARNING (1) `hl7.fhir.eu.base#2.0.0` is old; 2.0.1 available | ImplementationGuide | See 2-3. |
| 7-6 | WARNING (5) duplicate element ids in diagrams | `logicalmodels.html`, `journey-example.html`, `journey-data-evolution.html`, `CancerDataEvolution1.svg` | Several SVGs on one page reuse the same ids. Low; accept, or prefix ids per diagram. |
| 7-7 | INFORMATION (14) "could usefully have an OID assigned" | IG and all StructureDefinitions | Optional for HL7 Europe; accept or assign OIDs. |

**Publication request check:** fails: "Version 1.0.0-ballot has already been published", "This is not the first publication, so first must not be true". Fixed by 1-1.

**Suppressed messages:** 23 warnings and 34 hints, from 21 entries.

**Suppressions that hide fixable issues:**

| ID | Lines | Entry (uses) | Fix |
|---|---|---|---|
| 7-8 | 6 | `Unable to resolve resource with reference 'http://hl7.eu/fhir/cancer-common/StructureDefinition/%` | Hides the warning-level variants of 7-1; the errors stay. Remove once 7-1 is solved. |
| 7-9 | 30 | `Constraint failed: eld-21: '…(expression.exists())'` (0 uses) | The entry never matches because the message ends with " at CancerStage". Add expressions (3.2-1) and delete it, or end the entry with `%`. |
| 7-10 | 9 | `Coding has no system…` | Hides system-less codings in examples (3.4-2). Keep until code systems exist. |

**Stale entries** (0 uses, safe to delete), by line in `ignoreWarnings.txt`:

- **[7-11]** Line 16: `Unable to find ImplementationGuide.definition.resource.description for the resource Binary%`, with its comment on line 15. All examples now have descriptions.

---

## 8. Repository hygiene

- **[8-1]** `_note.md`: Italian working notes, tracked. Remove or move to the wiki.
- **[8-2]** `Requirements-fromNarrative.json` in the repository root, tracked, not used by the build. Remove or move to `input/resources` if intended.
- **[8-3]** `_sources/Cancer_Common_Logical_Model_20260408.xlsx` and `_sources/LogicalModelExample_v1.xlsx` are superseded by the 20260521 / v2 files cited in the models and pages; `input/images-source/old/` and four `CancerLogicalModel_2025112*.excalidraw` drafts. Remove or archive.
- **[8-4]** `phoenix-template/**/.index.db` and `.index.json` (12 files) are Publisher cache files, tracked. Add `.index.*` to `.gitignore` and remove them.
- **[8-5]** `input/fsh/examples/1-CancerStagePathological.fsh-bak` (ignored, local only). Delete.

---

## 9. Suggested order of work

1. Release configuration for 1.0.0 (1-1, 2-1, 2-2, 2-3, 2-4).
2. Fix the CancerStage invariants and the other invariant mismatches (1-3, 3.2-1 to 3.2-3).
3. Remove or write `designchoices.md` (1-2).
4. Clear the QA errors (7-1, 7-2), then the duplicate `project-nav` warnings in the local template (7-3).
5. Model fixes: 3.1-1, 3.1-2, decide 3.1-3, add FMM/status (2-6), add the ActiveSurveillance example (5-1).
6. Remove ballot wording and decide on the empty mapping pages (§6.2).
7. Content fixes on pages (§6.4), `knownissues.md` additions (§6.6).
8. Editorial and FSH cleanup (§3.3, §6.5, 3.1-4, 3.2-4 to 3.2-7, §5 Low items), `ignoreWarnings.txt` (7-8 to 7-11), repository hygiene (§8).
9. Write `changes.md` (6.1-1), rebuild, re-run this review.
10. After 1.0.0: move to the multi-language HL7 Europe template (2-12).

---

## Won't fix (accepted)

Items reviewed and accepted as they are. They keep their id and the structure of the section they come from; the last column gives the rationale.

| ID | Sev | Location | Finding | Rationale |
|---|---|---|---|---|
| 2-7 | Medium | `ig.ini:5`, `phoenix-template/` | The IG uses a local copy of the HL7 Europe template (`#phoenix-template`, `hl7.fhir.eu.template 0.0.1`) instead of a published template. | Decided on 2026-10-20: the local template is kept for 1.0.0. The move to the multi-language HL7 Europe template is tracked as a to-do (2-12). The warnings it causes stay open under 7-3. |

---

## Fixed since the first review

No items yet.
