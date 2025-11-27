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
<div>
  <p></p>
<figure>
  <a href="journeyOverview.svg" target="_blank">
    <img src="journeyOverview.svg" alt="Cancer Journey" width="100%">
  </a>
  <figcaption><strong>Figure 2: an example of a cancer patient journey [click to zoom]</strong></figcaption>
</figure>
  <p></p>
</div>


A more structured view of this example is documented in the following sections.

#### The overall journey

1. DIAGNOSIS + FIRST TREATMENT: After a set of procedures, Mary arrives to the Good Health Hospital were the clinicians basing on the available reports, asserts that she has a cancer (Cancer Condition.AssertedDate=ProcedureDate). They collect Mary's demographic data and cormobilities (Patient), and define the Clinical stage. The cancer is treated first with a Surgery on 2018/06/12 (Surgery.date=2018/06/12) and then with a Radiotherapy circle from 2018/09/10 to 2018/10/12 (Radiotherapy.StartDate=2018/09/10 and Radiotherapy.EndDate=2018/10/12), both with a definitive intent (Treatment.Intent=Definitive). If the Biopsy on the specimen collected durint the Surgery the Pathological Stage is defined.
1. OVERALL TREATMENT RESPONSE: After one or more medical diagnostic tests, Mary has a visit on 2018/10/30, when the clinictians evaluate that the first Treatment (Surgery and Radiotherapy) has a positive effect (Treatment.Response.TreatmentResponseType=Complete Remission and Treatment.Response.Date=2018/10/30 or the date of the medical diagnostic test): the cancer is completelly remited (Disease over time and space1.Disease Status=Complete Remission and Disease over time and space1.Asserted Date=2018/10/30 or the date of the medical diagnostic test). Mary is alive with no evidence of the disease (Patient.LifeStatus= Alive No Evidence Of Disease (NED) and Patient.Last Check=2018/10/30).
1. EVIDENCE + FOLLOWUP VISIT: After one or more medical diagnostic tests, Mary has a followup visit on 2019/02/28 when the clinictians confirms that the cancer is completelly remited (Disease over time and space2.Disease Status=Complete Remission and Disease over time and space2.Asserted Date=2019/02/28 or the date of the medical diagnostic test) and that Mary is alive with no evidence of the disease Patient.LifeStatus= Alive No Evidence Of Disease (NED) and Patient.Last Check=2019/02/28).
1. EVIDENCE + FOLLOWUP VISIT: After one or more medical diagnostic tests, Mary has another followup visits on 2019/05/30, when the clinictians confirms that the cancer is completelly remited (Disease over time and space3.Disease Status=Complete Remission and Disease over time and space3.Asserted Date=2019/05/30 or the date of the medical diagnostic test) and that Mary is alive with no evidence of the disease (Patient.LifeStatus= Alive No Evidence Of Disease (NED) and Patient.Last Check=2019/05/30).
1. EVIDENCE + FOLLOWUP VISIT (DISEASE EVOLUTION): After one or more medical diagnostic tests, Mary has a visit on 2019/08/31, when the clinictians evaluate that the cancer is recurred (Disease over time and space4.Disease Status=Recurrence and Disease over time and space4.Asserted Date=2019/08/31 or the date of the medical diagnostic test) also in different sites (Disease over time and space4.DiseaseExtent=present sites). Mary is alive with the disease (Patient.LifeStatus= Alive With Disease (AWD) and Patient.Last Check=2019/08/31).
1. TREATMENT: The cancer is treated with a chemioterapy from 2019/09/10 to 2019/12/16 (Drug Administration.StartDate=2019/09/10, Drug Administration.EndDate=2019/12/16).
1. EVIDENCE + FOLLOWUP VISIT: After one or more medical diagnostic tests, Mary has a visit on 2020/01/02, when the clinicians evaluate that the second treatment (chemioterary) has a quite positive effect (Treatment.Response.TreatmentResponseType=Partial Remission and Treatment.Response.Date=2020/01/02 or the date of the medical diagnostic test): the cancer extension is partially remited (Disease over time and space5.Disease Status=Partial Remission, Disease over time and space5.Asserted Date=2020/01/02 or the date of the medical diagnostic test and Disease over time and space5.DiseaseExtent=present sites). Mary is still alive with the disease (Patient.LifeStatus= Alive With Disease (AWD) and Patient.Last Check=2020/01/02).
1. EVIDENCE + FOLLOWUP VISIT (DISEASE EVOLUTION): After one or more medical diagnostic tests, Mary has a visit on 2020/04/15, when the clinicians evaluate that the cancer is grown (Disease over time and space6.Disease Status=Progression and Disease over time and space6.Asserted Date=2020/04/15 or the date of the medical diagnostic test), also in different sites (Disease over time and space6.DiseaseExtent=present sites). Mary is still alive with the disease Mary is still alive with the disease (Patient.LifeStatus= Alive With Disease (AWD) and Patient.Last Check=2020/04/15).
1. PATIENT'S DEATH: Mary dies on 2020/06/28 for the disease (Patient.LifeStatus= Dead of Disease (DOD) and Patient.Last Check=2020/06/28).

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

