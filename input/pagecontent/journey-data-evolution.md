This page illustrates how the entities and relationships defined in the conceptual model are instantiated and evolve over time along the cancer journey.

The purpose of this page is to show how the cancer journey is represented through the creation of multiple instances of core concepts at different moments in time, and how these instances are linked to each other to support a faithful reconstruction of the patient’s cancer history. The focus is therefore on temporal evolution and traceability, rather than on exhaustively describing all possible data elements.

In this representation, **concepts are not updated or overwritten**. Each clinically relevant moment is captured through the creation of a new instance reflecting the state of the disease, the patient, or a treatment at that specific point in time. This modeling approach enables a clear and unambiguous longitudinal interpretation of cancer data, supporting both care continuity and secondary use.

The clinical context and sequencing of events underpinning this data evolution are described in the [Cancer Patient Journey](journey.html) page.

To correctly interpret the content of this page, readers should therefore be familiar with the pages describing the [Conceptual Model](conceptualmodel.html) and the [Cancer Patient Journey](journey.html), which define the concepts and the narrative framework within which data evolve.

The following sections show how entities and relationships are instantiated at selected key moments of the cancer journey, using schematic representations based on the conceptual model to highlight temporal consistency and traceability.

### Diagnosis + First Treatment (Date 0 - 3)

This first step illustrates the initial instantiation of cancer-related entities at the time of diagnosis and during the first treatment episode. It corresponds to the “Diagnosis + First Treatment” phase described in the Cancer Patient Journey narrative.

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution1.svg %}
    <figcaption><strong>Figure 1 Data evolution: Diagnosis + First Treatment (Date 0 - 4)</strong></figcaption>    
</figure>
  <p></p>
 </div>

#### Date 0 – Cancer Condition Diagnosis

At **Date 0 (2018-05-01)**, the cancer journey formally begins with the instantiation of the entities representing the diagnostic state of the patient.
At this point, a **CancerConditionAtDiagnosis** instance (**CancerConditionAtDiagnosis1**) is created to capture the information related to the cancer diagnosis, including tumour characteristics such as tumour grade, histology behaviour and body site. In line with the conceptual model, the CancerConditionAtDiagnosis entity supports the presence of multiple diagnostic dates, reflecting the fact that the diagnostic process may span different clinical events, including diagnostic visits, biopsies, laboratory reports, and imaging examinations.

In this illustrative example, the **imaging date is used as the reference Date 0**, corresponding to an MRI examination performed on **2018-05-01**. This choice is purely exemplary and reflects the fact that, in this specific scenario, imaging represents the key element that triggered the diagnostic assessment.

Contextually, a **CancerPatient** instance (**CancerPatient1**) is instantiated to represent the patient, capturing demographic information and comorbidities at diagnosis.

To represent the diagnostic evidence, an **Imaging** instance (**Imaging1**) is created, describing the MRI examination performed at Date 0. This imaging instance represents the clinical evidence on which the clinical staging assessment is based.

Based on this imaging evidence, a **CancerStage** instance (**CancerStage1**) is instantiated to represent the **clinical stage** of the disease. In this example, the clinical stage is defined as:
*	type = Clinical,
*	classificationType = TNM,
*	value = T2, N0, M0.

The CancerStage instance (**CancerStage1**) is explicitly linked to the Imaging instance (**Imaging1**) through which it was defined, ensuring traceability between the staging assessment and the underlying diagnostic evidence. This explicit relationship preserves information on how and on the basis of which evidence the clinical stage was determined.

At the end of Date 0, the CancerConditionAtDiagnosis, CancerPatient, Imaging evidence, and clinical CancerStage are all instantiated as separate but interrelated entities, each reflecting the state of knowledge available at the time of diagnosis and forming the starting point for the subsequent evolution of the cancer journey.

#### Date 1 – Surgical Treatment and Pathological Staging

At **Date 1** (**2018-06-12**), the patient undergoes a surgical procedure with definitive intent. A **Surgery** instance (**Surgery1**) is created to represent this treatment event, linked to both the **CancerPatient1** (as subject) and the **CancerConditionAtDiagnosis1** (as treatment target).

Following surgery, new pathological evidence becomes available. Instead of updating the existing clinical stage, a **new CancerStage instance** (**CancerStage2**) is created to represent the pathological staging. This second stage is characterised by:
*	type = Pathological,
*	classificationType = TNM,
*	value = T2, N1, M0.

The pathological stage (**CancerStage2**) is explicitly linked to the surgical procedure (**Surgery1**) through which it was defined, while still referring to the same CancerConditionAtDiagnosis (**CancerConditionAtDiagnosis1**). The coexistence of clinical and pathological stages highlights the temporal nature of staging and preserves traceability of how staging information evolves over time.

#### Date 2–3 – Radiotherapy Course

Between **Date 2** (**2018-09-10**) and **Date 3** (**2018-10-12**), the patient receives a course of radiotherapy with definitive intent, in a postoperative (adjuvant) setting.

This treatment is represented by a **Radiotherapy** instance (**Radiotherapy1**), capturing:
*	start and end dates,
*	treatment intent,
*	target body site.

The radiotherapy instance (**Radiotherapy1**) is linked to the **CancerPatient1** as subject and to the **CancerConditionAtDiagnosis1** as treatment target. No existing entities are modified; instead, the treatment event is modeled as a new instance associated with the condition previously diagnosed and staged.

### Evidence + Overall Treatment Response (Complete Remission) (Date 4)

This second step represents the first **post treatment assessment** of the cancer journey and corresponds to the evaluation of the overall treatment response following the completion of the initial treatment course.

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution2.svg %}
    <figcaption><strong>Figure 2 Data evolution: Evidence + Overall Treatment Response (Complete Remission) (Date 4)</strong></figcaption>
</figure>
  <p></p>
</div>

#### Date 4 – Evidence, Overall Treatment Response and Disease Status Assessment

At **Date 4** (**2018-10-30**), after the completion of surgery and radiotherapy, new clinical evidence becomes available and a follow up visit takes place. This visit represents the first structured assessment of the response to the initial treatment strategy.

At this point, an **OverallCancerTreatmentResponse** instance (**OverallCancerTreatmentResponse1**) is instantiated to capture the evaluation of how the cancer condition has responded to the treatments administered so far. In this example, the overall treatment response is assessed as:
*	treatmentResponseType = Complete Remission,
*	date = 2018-10-30.

The OverallCancerTreatmentResponse instance is explicitly linked to the **CancerConditionAtDiagnosis** (**CancerConditionAtDiagnosis1**), ensuring that the response assessment is clearly associated with the condition that has been treated.

Based on this treatment response evaluation, clinicians subsequently assess the current status of the disease. This assessment is captured through the instantiation of a **ClinicalCancerProgression** instance (**ClinicalCancerProgression1**), which represents the disease status at Date 4. In this case, the disease status is recorded as:
*	diseaseStatus = Complete Remission,
*	extentType = Null,
*	assertedDate = 2018-10-30.

The ClinicalCancerProgression instance  (**ClinicalCancerProgression1**) is linked to the same **CancerConditionAtDiagnosis1**, reflecting the evolution of the disease over time without overwriting previous information. This explicit separation between treatment response evaluation and disease status allows the model to preserve the clinical reasoning process and to distinguish between response assessment and disease state assertion.

In parallel, the patient’s status is assessed and recorded through the instantiation of a **LastFollowUp** instance (**LastFollowUp1**). At Date 4, the patient is:
*	alive,
*	with no evidence of disease,
*	date = 2018-10-30.

The LastFollowUp instance  (**LastFollowUp1**) is linked to the **CancerPatient** (**CancerPatient1**) and captures the patient centred outcome of the follow up visit.

At the end of Date 4, the cancer journey includes newly instantiated entities representing the **overall treatment response**, the **current disease status**, and the **patient’s vital and disease related status**, all temporally aligned to the same follow up visit. Together, these entities document the transition from active treatment to a remission state and establish the baseline for subsequent monitoring and follow up assessments.

### Evidence + Follow-up Visits (Complete Remission) (Date 5 - 6)

This step illustrates subsequent follow up visits occurring after the initial assessment of complete remission. From a clinical perspective, the outcome remains unchanged and complete remission is confirmed at each visit.

However, from a data modeling perspective, each follow up visit represents a distinct clinical event that must be explicitly captured. For this reason, even in the absence of changes in disease status or patient outcome, **new instances** of **ClinicalCancerProgression** and **LastFollowUp** are created at each follow up visit. This approach ensures that all follow up assessments are temporally traceable and that the longitudinal evolution of the cancer journey is faithfully represented over time.

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution3.svg %}
    <figcaption><strong>Figure 3 Data evolution: Evidence + Follow-up Visits (Complete Remission) (Date 5 - 6)</strong></figcaption>
</figure>
  <p></p>
</div>

#### Date 5 – Evidence and Follow up Visit (Complete Remission)

At **Date 5** (**2019-02-28**), after additional diagnostic tests, the patient undergoes a follow up visit aimed at monitoring disease status in the absence of active treatment.

At this time point, clinicians confirm the previously observed disease status. A new **ClinicalCancerProgression** instance (**ClinicalCancerProgression2**) is instantiated to represent the disease assessment at this follow up visit. In this example, the disease status remains:
*	diseaseStatus = Complete Remission,
*	extentType = Null,
*	assertedDate = 2019-02-28.

Although the disease status does not change compared to the previous assessment, a **new instance** is created to explicitly capture the confirmation of complete remission at this specific moment in time. The instance is linked to the same **CancerConditionAtDiagnosis** (**CancerConditionAtDiagnosis1**), preserving continuity while maintaining temporal specificity.

In parallel, a new **LastFollowUp** instance (**LastFollowUp2**) is instantiated to record the patient’s status at Date 5. The patient is documented as:
*	vitalStatus = Alive,
*	evidenceOfDisease = No,
*	date = 2019 02 28.

The LastFollowUp instance (**LastFollowUp2**) is associated with the **CancerPatient1** and reflects the patient centred outcome of the follow up visit.

#### Date 6 – Evidence and Follow up Visit (Complete Remission)

At **Date 6** (**2019-05-30**), the patient undergoes another follow up visit supported by newly collected clinical evidence. The same clinical considerations observed at the previous follow up visit apply, and complete remission is confirmed.

In line with the modeling approach adopted throughout the cancer journey, **new instances** of **ClinicalCancerProgression** (**ClinicalCancerProgression3**) and **LastFollowUp** (**LastFollowUp3**) are created to explicitly record the disease status and patient status at this specific time point, even though no change in outcome is observed. This ensures full longitudinal traceability of follow up assessments over time.

##### Longitudinal Traceability Across Follow up Visits

At Dates 5 and 6, no modification of previously instantiated entities occurs. Instead, the model captures the confirmation of remission and patient status through the creation of new **ClinicalCancerProgression** and **LastFollowUp** instances at each follow up visit.

This approach reflects the principle that **clinical stability does not imply data immutability**: even when the disease status remains unchanged, each follow up visit represents a distinct clinical event that must be explicitly recorded. This ensures a faithful longitudinal representation of the cancer journey, enabling accurate reconstruction of events over time and supporting robust clinical interpretation and secondary use.

### Evidence + Follow-up Visit (Disease Evolution - Recurrence) and Second Treatment (Date 7 - 9)

This step illustrates a **disease evolution event** occurring after a period of stable complete remission and the subsequent initiation of a new treatment strategy. It corresponds to the identification of a recurrence during follow up and to the decision to restart active therapy.

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution4.svg %}
    <figcaption><strong>Figure 4 Data evolution: Evidence + Follow-up Visit (Disease Evolution - Recurrence) + Second Treatment (Date 7 - 9)</strong></figcaption>
</figure>
  <p></p>
</div>

#### Date 7 – Evidence and Follow up Visit (Recurrence)

At **Date 7** (**2019-08-31**), following one or more diagnostic tests, the patient undergoes a follow up visit during which clinicians identify a **recurrence of the disease**.

At this time point, a new **ClinicalCancerProgression** instance (**ClinicalCancerProgression4**) is created to represent the updated disease status. In this example, the disease is assessed as:
*	diseaseStatus = Recurrence,
*	extentType = Loco regional,
*	assertedDate = 2019-08-31.

The instantiation of a new ClinicalCancerProgression reflects a true **clinical change** with respect to previous assessments. This new instance does not overwrite earlier progression records but coexists with them, explicitly marking a new phase in the cancer journey.

In parallel, a new **LastFollowUp** instance (**LastFollowUp4**) is created to record the patient’s status at the same visit. At Date 7, the patient is:
*	vitalStatus = Alive,
*	evidenceOfDisease = Yes,
*	date = 2019-08-31.

Both the ClinicalCancerProgression (**ClinicalCancerProgression4**) and LastFollowUp (**LastFollowUp4**) instances are linked to the previously instantiated **CancerConditionAtDiagnosis1** and **CancerPatient1**, ensuring continuity while clearly representing the transition from remission to active disease.

#### Date 8–9 – Second Treatment (Systemic Therapy)

As a consequence of the documented recurrence, clinicians decide to initiate a new treatment course.

Between **Date 8** (**2019-09-10**) and **Date 9** (**2019-12-16**), the patient receives a **systemic treatment**. This treatment episode is represented by a **SystemicTreatment** instance (**SystemicTreatment1**), capturing:
*	treatment type (e.g. chemotherapy),
*	treatment intent (Definitive),
*	start date (2019-09-10),
*	end date (2019-12-16).

The SystemicTreatment instance is linked:
*	to the **CancerPatient1** as subject,
*	to the **CancerConditionAtDiagnosis1** as treatment target,
*	and explicitly to the **ClinicalCancerProgression** instance representing the recurrence (**ClinicalCancerProgression4**).

This explicit linkage makes clear that the treatment decision is driven by the newly identified disease recurrence and anchors the second treatment course to the specific clinical context in which it was initiated.

At the end of Date 9, the cancer journey includes a new disease evolution event and a corresponding new treatment episode, clearly delineating the transition from follow up to renewed active treatment following recurrence.

### Evidence + Follow-up Visit (Partial Remission) (Date 10)

This step illustrates the follow up visit performed after the completion of the second treatment course and represents the evaluation of the response to systemic therapy administered following disease recurrence.

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution5.svg %}
    <figcaption><strong>Figure 5 Data evolution: Evidence + Follow-up Visit (Partial Remission) (Date 10)</strong></figcaption>
</figure>
  <p></p>
</div>

#### Date 10 – Evidence, Overall Treatment Response and Disease Status Assessment

At **Date 10** (**2020-01-02**), after one or more diagnostic tests, the patient undergoes a follow up visit aimed at assessing the response to the systemic treatment initiated after the documented recurrence.

At this time point, clinicians first evaluate the response to the second treatment course. An **OverallCancerTreatmentResponse** instance (**OverallCancerTreatmentResponse2**) is instantiated to capture this assessment. In this example, the overall treatment response is evaluated as:
*	treatmentResponseType = Partial Remission,
*	date = 2020-01-02.

The OverallCancerTreatmentResponse instance (**OverallCancerTreatmentResponse2**) is linked to the **CancerConditionAtDiagnosis1** and explicitly refers to the previously recorded **ClinicalCancerProgression** instance representing the recurrence (**ClinicalCancerProgression4**). This relationship makes clear that the response assessment is performed in relation to the disease state identified at the time of recurrence.

Based on this treatment response assessment, clinicians subsequently update the disease status at the current visit. This is represented through the instantiation of a new **ClinicalCancerProgression** instance (**ClinicalCancerProgression5**), which captures the disease status at Date 10. In this case:
*	diseaseStatus = Partial Remission,
*	extentType = Loco regional,
*	assertedDate = 2020-01-02.

As in previous steps, the new ClinicalCancerProgression instance (**ClinicalCancerProgression5**) does not replace earlier progression records but coexists with them, explicitly documenting the evolution of the disease over time.

In parallel, the patient’s status at the follow up visit is recorded through a new **LastFollowUp** instance (**LastFollowUp5**). At Date 10, the patient is:
*	vitalStatus = Alive,
*	evidenceOfDisease = Yes,
*	date = 2020-01-02.

The LastFollowUp instance is linked to the **CancerPatient1** and reflects the persistence of disease despite a partial response to treatment.

At the end of Date 10, the cancer journey includes a newly documented treatment response assessment, an updated disease status reflecting partial remission, and a contemporaneous evaluation of patient status, setting the stage for subsequent follow up and possible further disease evolution.

### Evidence + Follow-up Visit (Progression) and Patient's Death (Date 11 - 12) 

This final step illustrates the last phase of the cancer journey, characterised by further disease evolution and by the final patient outcome. It includes the documentation of disease progression observed during follow up and the subsequent recording of the patient’s death.

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution6.svg %}
    <figcaption><strong>Figure 6 Data evolution: Evidence + Follow-up Visit (progression) and Patient's Death (Date 11 - 12) </strong></figcaption>
</figure>
  <p></p>
</div>

#### Date 11 – Evidence and Follow up Visit (Disease Progression)

At **Date 11** (**2020-04-15**), after one or more diagnostic tests, the patient undergoes a follow up visit during which clinicians evaluate a further evolution of the disease.

At this time point, a new **ClinicalCancerProgression** instance (**ClinicalCancerProgression6**) is instantiated to capture the updated disease status. In this example, the disease is assessed as:
*	diseaseStatus = Progression,
*	extentType = Metastatic,
*	assertedDate = 2020-04-15.

This new instance represents a clear clinical change with respect to the previously documented partial remission and marks a further step in disease evolution. As in all previous steps, the progression is recorded through the creation of a new instance rather than by updating existing ones, preserving the full history of disease assessments over time.

In parallel, a new **LastFollowUp** instance (**LastFollowUp6**) is created to record the patient’s status at the same follow up visit. At Date 11, the patient is:
*	vitalStatus = Alive,
*	evidenceOfDisease = Yes,
*	date = 2020-04-15.

Both the ClinicalCancerProgression (**ClinicalCancerProgression6**) and LastFollowUp (**LastFollowUp6**) instances are linked to the existing **CancerConditionAtDiagnosis1** and **CancerPatient1**, ensuring longitudinal consistency while documenting the worsening of disease status.

#### Date 12 – Patient’s Death

At **Date 12** (**2020-06-28**), the patient dies. This event represents the conclusion of the cancer journey and is captured through the instantiation of a new **LastFollowUp** instance (**LastFollowUp7**).
At this time point, the patient status is recorded as:
*	vitalStatus = Dead,
*	deathDate = 2020 06 28,
*	causeOfDeath = specified as available,
*	date = 2020-06-28.

No new disease progression instance is created at this stage, as death represents a **patient-level outcome** rather than a further evolution of disease status. The explicit separation between disease progression and patient outcome allows the model to clearly distinguish clinical assessments from final outcomes.

With the recording of the patient’s death, the cancer journey formally concludes. All prior entities and instances remain preserved, enabling a complete reconstruction of the longitudinal cancer history from diagnosis through disease evolution, treatments, follow up assessments, and final outcome.