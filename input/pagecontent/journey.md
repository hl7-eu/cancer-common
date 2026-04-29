##	Introduction

A patient’s cancer journey is a longitudinal sequence of events driven by the availability and interpretation of clinical evidence. It begins when one or more relevant evidences are identified, leads to the assertion and characterisation of a cancer condition, and continues through treatment, response assessment, and follow‑up over time.

Clinical evidence may derive from different contexts, including screening programmes, routine examinations, or investigations performed for reasons unrelated to cancer. The presence of symptoms is not required for the cancer journey to start. Clinical decisions along the cancer journey are based on the evaluation of evidence, on the observed response to treatment when a treatment has been administered, and on the resulting disease status.

Capturing **dates** consistently at each step of the journey is essential, as cancer care is inherently temporal. Evidence, assessments, and disease status must be interpreted in relation to specific time points in order to accurately reconstruct disease evolution for care continuity and for research and secondary use purposes.

## High‑level view of the cancer journey

At a high level, the cancer journey can be described as an **iterative, evidence driven process**, rather than as a simple linear pathway.

The following figure provides a high level representation of a typical cancer journey.

<div style="text-align:center;">
  <p></p>
  <figure>
    {% include overall-process.svg %}
    <figcaption><strong>Figure 1: the cancer patient journey</strong></figcaption>
  </figure>
  <p></p>
</div>

The journey usually begins with one or more sources of **clinical evidence** (e.g. imaging examinations, laboratory tests, biopsies). These evidences support the **assertion of a cancer diagnosis**. In some cases, additional evidence may be required to further characterise the cancer condition, for example to refine cancer stage or tumour characteristics (e.g. tumour grade).

Once a cancer condition has been asserted, clinicians may decide to initiate a **treatment**. Treatments can occur in one or more episodes and may be of different types (i.e. surgery, radiotherapy, systemic treatment, active surveillance).

After a treatment has been delivered, new clinical **evidence** is collected. This post treatment evidence is required to support a **follow up visit**, during which the effect of the treatment is evaluated, the current status of the disease is determined and the next steps are defined. This cycle of **evidence collection → assessment → decision** may repeat multiple times over the course of the disease.

### Follow-up visit

More generally, follow up visits are events in which decisions about the continuation, modification, or conclusion of the cancer journey are made. They are always based on available evidence and represent the clinical events in which the disease and patient status are evaluated.

When a follow up visit occurs after a treatment episode, clinicians first evaluate the **overall treatment response**, based on available evidence. Treatment response reflects how the cancer condition has responded to the administered therapy (complete remission, partial remission, stable disease, progression). Based on the treatment response assessment, clinicians subsequently derive and record the **current disease status**, and the **status of the patient**.

When no treatment has been administered and the patient is under active monitoring, follow up visits support a **direct evaluation of disease status and patient status**, based on evidence, without an explicit treatment response assessment.

During follow up visits, disease status is evaluated using the concepts defined in the conceptual model (i.e. stable disease, partial remission, complete remission, progression, recurrence). Recurrence is identified only during follow up, after a remission has been documented, and reflects the re appearance of disease following an earlier disease free period.

At each follow up visit, **patient status** is also assessed by recording:
*	vital status (alive or dead),
*	the presence or absence of evidence of disease.

Based on follow up assessments, different outcomes are possible:
*	**Continuation of follow up**, through further monitoring visits or additional evidence collection;
*	**Initiation of additional treatment**, in response to stable disease, recurrence, or progression;
* **Follow-up end**, which may occur in one of the following cases:
  *	**Completion of active cancer follow up**, when the patient remains alive with no evidence of disease and, for the specific cancer type and clinical context, no further routine cancer specific follow up is considered necessary;
  *	**Death of the patient**.

Completion of active cancer follow up reflects a clinical decision that cancer specific monitoring is no longer required and does not imply the absence of general healthcare follow up for other conditions.

Although continued follow up is generally intended, **loss to follow up** may occur when a patient does not return for scheduled assessments. In these situations, the cancer journey does not formally conclude through a clinical outcome but instead reflects **missing information due to limited data availability**.

## Illustrative Example of a Typical Cancer Journey

The following section presents an illustrative example of a Typical Cancer Journey, intended to show how the [European Cancer Common Conceptual Model](https://build.fhir.org/ig/hl7-eu/cancer-common/conceptualmodel.html) can be applied to represent the evolution of a cancer condition over time.

The example is provided for explanatory purposes only and does not represent a clinical guideline or a recommended care pathway. Its goal is to make the conceptual model more concrete by illustrating how its core concepts and relationships can be used to describe a longitudinal cancer journey, from diagnosis through treatment, follow up, disease evolution, and final outcomes.

This page focuses on the conceptual level, showing how the cancer journey can be described using the entities and relationships defined in the conceptual model, together with schematic representations of the main steps and their temporal ordering. A more detailed view of how data are instantiated and evolve over time is provided in dedicated [Data Evolution](https://build.fhir.org/ig/hl7-eu/cancer-common/journey-data-evolution.html) page. The [Logical Model](https://build.fhir.org/ig/hl7-eu/cancer-common/logicalmodels.html) is described in a dedicated section of this Implementation Guide, where a corresponding Data Evolution at the logical level is also presented in greater detail.

### The overall journey

An example of this journey is described in Figure 2 where steps, relevant dates, and information collected or updated are highlighted.

<div style="overflow-x:auto; text-align:center;">
  <p></p>
  <figure>
    <a href="journeyOverview.png" target="_blank">
      <img src="journeyOverview.png" alt="Cancer Journey" style="height:45rem;">
    </a>
    <figcaption><strong>Figure 2: an example of a cancer patient journey [click to zoom]</strong></figcaption>
  </figure>
  <p></p>
</div>
<br/>

1. DIAGNOSIS + FIRST TREATMENT: After a set of procedures, Mary arrives at the Good Health Hospital, where she undergoes a magnetic resonance imaging examination (Imaging.Type=MRI, Imaging1.BodySite=XXX). Based on the imaging results, clinicians identify the presence of a cancer condition and record the diagnosis evidence date as the imaging date (CancerConditionAtDiagnosis.ImagingDate=2018/05/01, CancerConditionAtDiagnosis.HistologyBehaviour=XXX, CancerConditionAtDiagnosis.BodySite=XXX, CancerConditionAtDiagnosis.TumorGrade=XXX,). Clinicians collect Mary’s demographic information and comorbidities (CancerPatient) and define the initial cancer stage as clinical, based on imaging findings (CancerStage.Type=Clinical, CancerStage.ClassificationType=TNM, CancerStage.Value=[T2,N0,M0], CancerStage.ImagingReference=Imaging 1). The cancer is first treated with a surgery performed on 2018/06/12 (Surgery.Date=2018/06/12, Surgery.Intent=Definitive, Surgery.Subject=CancerPatient, Surgery.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis, Surgery.BodySite=XXX). Following the surgical procedure, the cancer stage is reassessed and defined as pathological, based on surgical findings (CancerStage.Type=Pathological, CancerStage.ClassificationType=TNM, CancerStage.Value=[T2,N1,M0], CancerStage.SurgeryReference=Surgery). After surgery, Mary undergoes a course of radiotherapy from 2018/09/10 to 2018/10/12, with definitive intent (Radiotherapy.StartDate=2018/09/10, Radiotherapy.EndDate=2018/10/12, Radiotherapy.BodySite=XXX, Radiotherapy.Intent=Definitive, Radiotherapy.Subject=CancerPatient, Radiotherapy.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis).
1. OVERALL TREATMENT RESPONSE: After one or more diagnostic tests, Mary has a visit on 2018/10/30, during which clinicians first evaluate the response to the initial treatment. The overall response is assessed as complete remission (OverallCancerTreatmentResponse1.TreatmentResponseType=CompleteRemission, OverallCancerTreatmentResponse1.Date=2018/10/30, OverallCancerTreatmentResponse1.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis). Based on this treatment response assessment, clinicians subsequently update the disease status, recording a complete remission (ClinicalCancerProgression1.DiseaseStatus=CompleteRemission, ClinicalCancerProgression1.AssertedDate=2018/10/30, ClinicalCancerProgression1.ExtentType=Null). Mary is alive with no evidence of disease (LastFollowUp1.VitalStatus=Alive, LastFollowUp1.EvidenceOfDisease=No, LastFollowUp1.Date=2018/10/30, LastFollowUp1.Subject=CancerPatient).
1. EVIDENCE + FOLLOWUP VISIT: After one or more diagnostic tests, Mary has a follow up visit on 2019/02/28, when clinicians confirm complete remission (ClinicalCancerProgression2.DiseaseStatus=CompleteRemission, ClinicalCancerProgression2.AssertedDate=2019/02/28). Mary remains alive with no evidence of disease (LastFollowUp2.VitalStatus=Alive, LastFollowUp2.EvidenceOfDisease=No, LastFollowUp2.Date=2019/02/28).
1. EVIDENCE + FOLLOWUP VISIT: After one or more diagnostic tests, Mary has another follow up visit on 2019/05/30, when clinicians confirm complete remission (ClinicalCancerProgression3.DiseaseStatus=CompleteRemission, ClinicalCancerProgression3.AssertedDate=2019/05/30). Mary is still alive with no evidence of disease (LastFollowUp3.VitalStatus=Alive, LastFollowUp3.EvidenceOfDisease=No, LastFollowUp3.Date=2019/05/30).
1. EVIDENCE + FOLLOWUP VISIT (DISEASE EVOLUTION): After one or more diagnostic tests, Mary has a visit on 2019/08/31, when clinicians evaluate a recurrence (ClinicalCancerProgression4.DiseaseStatus=Recurrence, ClinicalCancerProgression4.AssertedDate=2019/08/31). The recurrence is described as loco regional (ClinicalCancerProgression4.ExtentType=Loco-regional, ClinicalCancerProgression4.LocoRegionalSites=XXXXX). Mary is alive with evidence of disease (LastFollowUp4.VitalStatus=Alive, LastFollowUp4.EvidenceOfDisease=Yes, LastFollowUp4.Date=2019/08/31)
1. TREATMENT: The cancer is treated with a systemic therapy from 2019/09/10 to 2019/12/16 (SystemicTreatment1.Type=Chemiotherapy, SystemicTreatment1.StartDate=2019/09/10, SystemicTreatment1.EndDate=2019/12/16, SystemicTreatment1.Intent=Definitive, SystemicTreatment1.Subject=CancerPatient, SystemicTreatment1.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis, SystemicTreatment1.ClinicalCancerProgressionReference=ClinicalCancerProgression4).
1. EVIDENCE + FOLLOWUP VISIT: After one or more diagnostic tests, Mary has a visit on 2020/01/02. Clinicians first evaluate the response to the systemic treatment administered following the previous disease recurrence. The overall treatment response is assessed as partial remission (OverallCancerTreatmentResponse2.TreatmentResponseType=PartialRemission, OverallCancerTreatmentResponse2.Date=2020/01/02, OverallCancerTreatmentResponse2.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis, OverallCancerTreatmentResponse2.ClinicalCancerProgressionReference=ClinicalCancerProgression4). This response assessment refers to the previously recorded ClinicalCancerProgression (defined at the time of recurrence) and is used as the basis to subsequently update the disease status at the current visit. Clinicians therefore record a partial remission (ClinicalCancerProgression5.DiseaseStatus=PartialRemission, ClinicalCancerProgression5.AssertedDate=2020/01/02, ClinicalCancerProgression5.ExtentType=Loco-regional, ClinicalCancerProgression5.LocoRegionalSites=XXXXX). Mary remains alive with evidence of disease (LastFollowUp5.VitalStatus=Alive, LastFollowUp5.EvidenceOfDisease=Yes, LastFollowUp5.Date=2020/01/02).
1. EVIDENCE + FOLLOWUP VISIT (DISEASE EVOLUTION): After one or more diagnostic tests, Mary has a visit on 2020/04/15, when clinicians evaluate disease progression (ClinicalCancerProgression6.DiseaseStatus=Progression, ClinicalCancerProgression6.AssertedDate=2020/04/15). The disease extent is metastatic (ClinicalCancerProgression6.ExtentType=Metastatic, ClinicalCancerProgression6.MetastaticSites=XXXXX). Mary is alive with evidence of disease (LastFollowUp6.VitalStatus=Alive, LastFollowUp6.EvidenceOfDisease=Yes, LastFollowUp6.Date=2020/04/15).
1. PATIENT'S DEATH: Mary dies on 2020/06/28 (LastFollowUp7.VitalStatus=Dead, LastFollowUp7.Date=2020/06/28, LastFollowUp7.DeathDate=2020/06/28, LastFollowUp7.Subject=CancerPatient, LastFollowUp7.CauseOfDeath=XXX).


<div style="text-align:center;">
  <p></p>
  <figure>
      {% include CancerJourney.svg %}
      <figcaption><strong>Figure 3: the cancer journey: overall flow</strong></figcaption>
  </figure>
  <p></p>
</div>



<!-- #### Data Collection per step

##### From diagnosis to first follow-up
<div style="text-align:center;">
  <p></p>
  <figure>
      {% include CancerJourneyData1.svg %}
      <figcaption><strong>Figure 4: the cancer journey: from diagnosis to first follow-up</strong></figcaption>
  </figure>
  <p></p>
</div>

Key data captured in this phase

- Presentation and evidence dates; type of evidence (imaging, pathology, labs) and results.
- Condition assertion: primary site, histology, behavior; assertion/confirmation date.
- Staging: scheme/version (e.g., AJCC), stage group and date; staging basis.
- Initial management plan and intent; care team and performing organization.
- First follow-up appointment date and any early assessment of response.

##### From first follow-up to first drug treatment
<div style="text-align:center;">
  <p></p>
  <figure>
      {% include CancerJourneyData2.svg %}
      <figcaption><strong>Figure 5: the cancer journey: from first follow-up to first drug treatment</strong></figcaption>
  </figure>
  <p></p>
</div>

Key data captured in this phase

- Treatment decision date and modality (surgery, radiation, systemic).
- Surgical details (if applicable): procedure, site, margins, path results and dates.
- Radiation (if applicable): plan, modality, dose/fractions, start date.
- Systemic therapy plan: regimen/agents, line of therapy, intent, planned start date.
- Follow-up assessments: clinical status, imaging/lab updates, ECOG/PS if used.

##### From first drug treatment to patient death
<div style="text-align:center;">
  <p></p>
  <figure>
      {% include CancerJourneyData3.svg %}
      <figcaption><strong>Figure 6: the cancer journey: from first drug treatment to patient death</strong></figcaption>
  </figure>
  <p></p>
</div>

Key data captured in this phase

- Systemic treatment administration: start/stop dates, cycles, dosing changes, holds.
- Response evaluations (e.g., RECIST): assessment date and outcome (CR/PR/SD/PD).
- Adverse events: dates, grade/severity, relationship to treatment, actions taken.
- Progression/recurrence events: date, site/pattern, basis of determination.
- Subsequent lines of therapy and outcomes; death date and, if available, cause.


#### Data evolution

Details are provided on the page [Data evolution](journey-data-evolution.html) -->

