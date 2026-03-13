A patient's cancer journey is a longitudinal sequence of events that starts with presentation and evidence gathering, continues through condition assertion and staging, proceeds to treatment (often in overlapping episodes), and is followed by ongoing assessment of response and disease status. Capturing **dates** consistently for each step is essential so the timeline can be accurately reconstructed for care and research.

The following figure describes, at a high level, this process.
<div>
  <p></p>
<figure>
  {% include overall-process.svg %}
  <figcaption><strong>Figure 1: the cancer patient journey</strong></figcaption>
</figure>
  <p></p>
</div>

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


A more structured view of this example is documented in the following sections.

#### The overall journey

1. DIAGNOSIS + FIRST TREATMENT: After a set of procedures, Mary arrives at the Good Health Hospital, where she undergoes a magnetic resonance imaging examination (Imaging.Type=MRI, Imaging1.BodySite=XXX). Based on the imaging results, clinicians identify the presence of a cancer condition and record the diagnosis evidence date as the imaging date (CancerConditionAtDiagnosis.ImagingDate=2018/05/01, CancerConditionAtDiagnosis.HistologyBehaviour=XXX, CancerConditionAtDiagnosis.BodySite=XXX, CancerConditionAtDiagnosis.TumorGrade=XXX,). Clinicians collect Mary’s demographic information and comorbidities (CancerPatient) and define the initial cancer stage as clinical, based on imaging findings (CancerStage.Type=Clinical, CancerStage.ClassificationType=TNM, CancerStage.Value=[T2,N0,M0], CancerStage.ImagingReference=Imaging 1). The cancer is first treated with a surgery performed on 2018/06/12 (Surgery.Date=2018/06/12, Surgery.Intent=Definitive, Surgery.Subject=CancerPatient, Surgery.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis, Surgery.BodySite=XXX). Following the surgical procedure, the cancer stage is reassessed and defined as pathological, based on surgical findings (CancerStage.Type=Pathological, CancerStage.ClassificationType=TNM, CancerStage.Value=[T2,N1,M0], CancerStage.SurgeryReference=Surgery). After surgery, Mary undergoes a course of radiotherapy from 2018/09/10 to 2018/10/12, with definitive intent (Radiotherapy.StartDate=2018/09/10, Radiotherapy.EndDate=2018/10/12, Radiotherapy.BodySite=XXX, Radiotherapy.Intent=Definitive, Radiotherapy.Subject=CancerPatient, Radiotherapy.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis).
1. OVERALL TREATMENT RESPONSE: After one or more diagnostic tests, Mary has a visit on 2018/10/30, during which clinicians first evaluate the response to the initial treatment. The overall response is assessed as complete remission (OverallCancerTreatmentResponse1.TreatmentResponseType=CompleteRemission, OverallCancerTreatmentResponse1.Date=2018/10/30, OverallCancerTreatmentResponse1.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis). Based on this treatment response assessment, clinicians subsequently update the disease status, recording a complete remission (ClinicalCancerProgression1.DiseaseStatus=CompleteRemission, ClinicalCancerProgression1.AssertedDate=2018/10/30, ClinicalCancerProgression1.ExtentType=Null). Mary is alive with no evidence of disease (LastFollowUp1.VitalStatus=Alive, LastFollowUp1.EvidenceOfDisease=No, LastFollowUp1.Date=2018/10/30, LastFollowUp1.Subject=CancerPatient).
1. EVIDENCE + FOLLOWUP VISIT: After one or more diagnostic tests, Mary has a follow‑up visit on 2019/02/28, when clinicians confirm complete remission (ClinicalCancerProgression2.DiseaseStatus=CompleteRemission, ClinicalCancerProgression2.AssertedDate=2019/02/28). Mary remains alive with no evidence of disease (LastFollowUp2.VitalStatus=Alive, LastFollowUp2.EvidenceOfDisease=No, LastFollowUp2.Date=2019/02/28).
1. EVIDENCE + FOLLOWUP VISIT: After one or more diagnostic tests, Mary has another follow‑up visit on 2019/05/30, when clinicians confirm complete remission (ClinicalCancerProgression3.DiseaseStatus=CompleteRemission, ClinicalCancerProgression3.AssertedDate=2019/05/30). Mary is still alive with no evidence of disease (LastFollowUp3.VitalStatus=Alive, LastFollowUp3.EvidenceOfDisease=No, LastFollowUp3.Date=2019/05/30).
1. EVIDENCE + FOLLOWUP VISIT (DISEASE EVOLUTION): After one or more diagnostic tests, Mary has a visit on 2019/08/31, when clinicians evaluate a recurrence (ClinicalCancerProgression4.DiseaseStatus=Recurrence, ClinicalCancerProgression4.AssertedDate=2019/08/31). The recurrence is described as loco‑regional (ClinicalCancerProgression4.ExtentType=Loco-regional, ClinicalCancerProgression4.LocoRegionalSites=XXXXX). Mary is alive with evidence of disease (LastFollowUp4.VitalStatus=Alive, LastFollowUp4.EvidenceOfDisease=Yes, LastFollowUp4.Date=2019/08/31)
1. TREATMENT: The cancer is treated with a systemic therapy from 2019/09/10 to 2019/12/16 (SystemicTreatment1.Type=Chemiotherapy, SystemicTreatment1.StartDate=2019/09/10, SystemicTreatment1.EndDate=2019/12/16, SystemicTreatment1.Intent=Definitive, SystemicTreatment1.Subject=CancerPatient, SystemicTreatment1.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis, SystemicTreatment1.ClinicalCancerProgressionReference=ClinicalCancerProgression4).
1. EVIDENCE + FOLLOWUP VISIT: After one or more diagnostic tests, Mary has a visit on 2020/01/02. Clinicians first evaluate the response to the systemic treatment administered following the previous disease recurrence. The overall treatment response is assessed as partial remission (OverallCancerTreatmentResponse2.TreatmentResponseType=PartialRemission, OverallCancerTreatmentResponse2.Date=2020/01/02, 
OverallCancerTreatmentResponse2.CancerConditionAtDiagnosisReference=CancerConditionAtDiagnosis, OverallCancerTreatmentResponse2.ClinicalCancerProgressionReference=ClinicalCancerProgression4). This response assessment refers to the previously recorded ClinicalCancerProgression (defined at the time of recurrence) and is used as the basis to subsequently update the disease status at the current visit. Clinicians therefore record a partial remission (ClinicalCancerProgression5.DiseaseStatus=PartialRemission, ClinicalCancerProgression5.AssertedDate=2020/01/02, ClinicalCancerProgression5.ExtentType=Loco-regional, ClinicalCancerProgression5.LocoRegionalSites=XXXXX). Mary remains alive with evidence of disease (LastFollowUp5.VitalStatus=Alive, LastFollowUp5.EvidenceOfDisease=Yes, LastFollowUp5.Date=2020/01/02).
1. EVIDENCE + FOLLOWUP VISIT (DISEASE EVOLUTION): After one or more diagnostic tests, Mary has a visit on 2020/04/15, when clinicians evaluate disease progression (ClinicalCancerProgression6.DiseaseStatus=Progression, ClinicalCancerProgression6.AssertedDate=2020/04/15). The disease extent is metastatic (ClinicalCancerProgression6.ExtentType=Metastatic, ClinicalCancerProgression6.MetastaticSites=XXXXX). Mary is alive with evidence of disease (LastFollowUp6.VitalStatus=Alive, LastFollowUp6.EvidenceOfDisease=Yes, LastFollowUp6.Date=2020/04/15).
1. PATIENT'S DEATH: Mary dies on 2020/06/28 (LastFollowUp7.VitalStatus=Dead, LastFollowUp7.Date=2020/06/28, LastFollowUp7.DeathDate=2020/06/28, LastFollowUp7.Subject=CancerPatient, 
LastFollowUp7.CauseOfDeath=XXX).

<div>
  <p></p>
<figure>
    {% include CancerJourney.svg %}
    <figcaption><strong>Figure 3: the cancer journey: overall flow</strong></figcaption>
</figure>
  <p></p>
</div>



#### Data Collection per step

##### From diagnosis to first follow-up
<div>
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
<div>
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
<div>
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

Details are provided on the page [Data evolution](journey-data-evolution.html)

