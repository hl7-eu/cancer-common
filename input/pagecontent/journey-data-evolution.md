This page illustrates how the entities and relationships defined in the conceptual model evolve over time along the cancer journey.

The purpose of this page is not to provide a complete population of all attributes defined in the conceptual model. Instead, it focuses on showing how core concepts are instantiated at different moments of the journey, how they relate to each other over time, and how these relationships allow the reconstruction of the cancer history. In this conceptual representation, not all attributes defined in the model are populated. A complete and exhaustive population of all attributes is instead provided through a dedicated logical‑level example at [Cancer Patient Journey Example](https://build.fhir.org/ig/hl7-eu/cancer-common/journey-example.html). While this page remains at the conceptual level, focusing on entities, instances, and their temporal relationships, the logical‑level example shows how all elements and attributes are instantiated in a concrete data representation, fully aligned with the [Logical Model](https://build.fhir.org/ig/hl7-eu/cancer-common/logicalmodels.html).

Only a selected subset of attributes is therefore represented, with the sole objective of illustrating:

* the temporal evolution of key entities,
* the creation of multiple instances of the same concept at different time points,
* the relationships that must be preserved over time to correctly trace the sequence of clinical events.

In this representation, **concepts are not updated or overwritten**. Each relevant clinical moment is captured by the creation of a new instance representing the state of the disease, the patient, or the treatment at that specific point in time. This approach enables a clear and unambiguous reconstruction of the cancer journey, supporting longitudinal interpretation and analysis.

The clinical context and sequencing of events underpinning this data evolution are described in the [Cancer Patient Journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html) page.

To correctly interpret the content of this page, readers should therefore be familiar with the pages describing the [Conceptual Model](https://build.fhir.org/ig/hl7-eu/cancer-common/conceptualmodel.html) and the [Cancer Patient Journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html), which define the concepts and the narrative framework within which data evolve.

The following sections show how entities and relationships are instantiated at selected key moments of the cancer journey, using schematic representations based on the conceptual model to highlight temporal consistency and traceability.

### Diagnosis + First Treatment (Date 0 - 3)

This section corresponds to Step 1 DIAGNOSIS + FIRST TREATMENT of the [Cancer Patient Journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html#the-overall-journey), in which a cancer condition is identified based on available clinical evidence and the first therapeutic intervention is delivered.

At diagnosis (Date 0), the model captures a first conceptual snapshot of the disease by instantiating a **CancerConditionAtDiagnosis**, linked to the **CancerPatient**. Diagnostic evidence (e.g. imaging, biopsy, laboratory reports) supports both the assertion of the cancer condition and the definition of an clinical cancer stage, which reflects the best available knowledge at that time. This clinical stage (**ClinicalStage1**) is therefore defined in relation to diagnostic evidence (**Imaging1**) and explicitly linked to the corresponding examinations (**Imaging1**).

Once treatment is delivered, additional clinical information may become available. In this example, **Surgery1** (Date 1) produces new evidence that allows a more accurate characterisation of the disease. Rather than updating the previously defined cancer stage (**ClinicalStage1**), the model represents this change by creating a new, distinct pathological cancer stage, explicitly linked to the surgical procedure (**ClinicalStage2**). This preserves the original clinical assessment while enabling temporal traceability of disease re‑evaluation.
Subsequent treatment episodes, such as **Radiotherapy1** (Date 2 - Date 3), are represented as separate instances, each associated with its own time frame, intent, and target, and consistently linked to the patient and the originally asserted cancer condition.

The diagram below illustrates how, even at this early phase of the journey, multiple instances of the same conceptual entities (e.g. cancer stage) coexist to reflect disease evolution over time, ensuring that diagnostic assessments and treatment‑driven re‑evaluations remain clearly distinguished and temporally ordered.

<div>
  <p></p>
<figure>
    <img src="CancerDataEvolution1.svg" alt="Cancer Model" width="70%"/>
    <figcaption><strong>Figure 1 Data evolution: Diagnosis + First Treatment (Date 0 - 4)</strong></figcaption>
</figure>
  <p></p>
 </div>

### Evidence + Overall Treatment Response (Complete Remission) (Date 4)

RICOMONCIA DA QUI


<div>
  <p></p>
<figure>
    {% include CancerDataEvolution2.svg %}
    <figcaption><strong>Figure 2 Data evolution: Evidence + Overall Treatment Response (Complete Remission) (Date 4)</strong></figcaption>
</figure>
  <p></p>
</div>

### Evidence + Follow-up Visits (Complete Remission) (Date 5 - 6)
<div>
  <p></p>
<figure>
    {% include CancerDataEvolution3.svg %}
    <figcaption><strong>Figure 3 Data evolution: Evidence + Follow-up Visits (Complete Remission) (Date 5 - 6)</strong></figcaption>
</figure>
  <p></p>
</div>

### Evidence + Follow-up Visit (Disease Evolution - Recurrence) + Second Treatment (Date 7 - 9)
<div>
  <p></p>
<figure>
    {% include CancerDataEvolution4.svg %}
    <figcaption><strong>Figure 4 Data evolution: Evidence + Follow-up Visit (Disease Evolution - Recurrence) + Second Treatment (Date 7 - 9)</strong></figcaption>
</figure>
  <p></p>
</div>

### Evidence + Follow-up Visit (Partial Remission) (Date 10)
<div>
  <p></p>
<figure>
    {% include CancerDataEvolution5.svg %}
    <figcaption><strong>Figure 5 Data evolution: Evidence + Follow-up Visit (Partial Remission) (Date 10)</strong></figcaption>
</figure>
  <p></p>
</div>

### Evidence + Follow-up Visit (Progression) and Patient's Death (Date 11 - 12) 
<div>
  <p></p>
<figure>
    {% include CancerDataEvolution6.svg %}
    <figcaption><strong>Figure 6 Data evolution: Evidence + Follow-up Visit (progression) and Patient's Death (Date 11 - 12) </strong></figcaption>
</figure>
  <p></p>
</div>
