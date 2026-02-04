### Overview

The figure below provides an overview of the main concepts and of their relationships

<div>
  <p></p>
  <figure>
    {% include CancerLogicalModel_LM.svg %}
    <figcaption><strong>Figure 1: Cancer Common Logical Model Overview</strong></figcaption>
  </figure>
  <p></p>
</div>

<div>
  <p></p>
  <figure>
    {% include CancerLogicalModel_LM_refs.svg %}
    <figcaption><strong>Figure 2: Cancer Common Logical Model (References)</strong></figcaption>
  </figure>
  <p></p>
</div>


### Logical Models

#### CancerPatient

Represents the subject affected by one or more cancer conditions, including demographics, life status/cause, last check date, and comorbidities.

<div>
  <p></p>
  <figure>
    {% include Patient_LM.svg %}
    <figcaption><strong>Figure 3: CancerPatient logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-CancerPatient.html](StructureDefinition-CancerPatient.html)

#### CancerConditionAtDiagnosis

Represents the cancer condition at first diagnosis and captures histology behaviour, body site, tumour grade, asserted date, and base of assertion.

<div>
  <p></p>
  <figure>
    {% include CancerConditionAtDiagnosis_LM.svg %}
    <figcaption><strong>Figure 4: CancerConditionAtDiagnosis logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-CancerConditionAtDiagnosis.html](StructureDefinition-CancerConditionAtDiagnosis.html)

#### CancerStage

Represents the stage at first diagnosis and tumour extent at the time of the first definitive treatment; clinical (imaging) or pathological (surgery), and it does not evolve.

<div>
  <p></p>
  <figure>
    {% include CancerStage_LM.svg %}
    <figcaption><strong>Figure 5: CancerStage logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-CancerStage.html](StructureDefinition-CancerStage.html)

#### Imaging

Referenced in the glossary as evidence/procedure used to detect the cancer condition, define body site, support clinical stage, and assess disease evolution.

<div>
  <p></p>
  <figure>
    {% include Imaging_LM.svg %}
    <figcaption><strong>Figure 6: Imaging logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-Imaging.html](StructureDefinition-Imaging.html)

#### LastFollowUp

Corresponds to the Last Check in the glossary: the date of the visit in which life status (and cause) is detected.

<div>
  <p></p>
  <figure>
    {% include LastFollowUp_LM.svg %}
    <figcaption><strong>Figure 7: LastFollowUp logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-LastFollowUp.html](StructureDefinition-LastFollowUp.html)

#### ClinicalCancerProgression

Represents disease over time and space; each evaluation creates a new instance with disease status, asserted date, and base of assertion, and may include disease extent and related findings.

<div>
  <p></p>
  <figure>
    {% include ClinicalCancerProgression_LM.svg %}
    <figcaption><strong>Figure 8: ClinicalCancerProgression logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-ClinicalCancerProgression.html](StructureDefinition-ClinicalCancerProgression.html)

#### Surgery

Treatment type characterized by a date and a target site.

<div>
  <p></p>
  <figure>
    {% include Surgery_LM.svg %}
    <figcaption><strong>Figure 9: Surgery logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-Surgery.html](StructureDefinition-Surgery.html)

#### ActiveSurveillance

Treatment type characterized by start date and end date.

<div>
  <p></p>
  <figure>
    {% include ActiveSurveillance_LM.svg %}
    <figcaption><strong>Figure 10: ActiveSurveillance logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-ActiveSurveillance.html](StructureDefinition-ActiveSurveillance.html)

#### Radiotherapy

Treatment type characterized by start date, end date, and target site.

<div>
  <p></p>
  <figure>
    {% include Radiotherapy_LM.svg %}
    <figcaption><strong>Figure 11: Radiotherapy logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-Radiotherapy.html](StructureDefinition-Radiotherapy.html)

#### SystemicTreatment

Corresponds to drug administration treatment, characterized by start/end date and possible ongoing indication (e.g., immunotherapy).

<div>
  <p></p>
  <figure>
    {% include SystemicTreatment_LM.svg %}
    <figcaption><strong>Figure 12: SystemicTreatment logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-SystemicTreatment.html](StructureDefinition-SystemicTreatment.html)

#### OverallCancerTreatmentResponse

Represents how well a cancer patient responds to a treatment (e.g., progression, stable disease, partial/complete remission) based on evidence and date.

<div>
  <p></p>
  <figure>
    {% include OverallCancerTreatmentResponse_LM.svg %}
    <figcaption><strong>Figure 13: OverallCancerTreatmentResponse logical model</strong></figcaption>
  </figure>
  <p></p>
</div>

FHIR Logical Model: [StructureDefinition-OverallCancerTreatmentResponse.html](StructureDefinition-OverallCancerTreatmentResponse.html)

