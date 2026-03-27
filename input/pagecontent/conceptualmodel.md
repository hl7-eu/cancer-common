
### The European Cancer Common Conceptual Model

The European Cancer Common Conceptual Model represents the foundational layer of the European Cancer Common Data Model (ECCDM). It defines a **minimum, extensible, and non exhaustive set of cancer related concepts and their relationships**, providing a shared, platform independent representation of the cancer domain.

The purpose of the conceptual model is to establish a **common semantic backbone** that can be reused consistently across different technical representations and standards. It focuses on defining *what the core cancer concepts are* and *how they relate to each other* throughout the cancer journey, independently from implementation and technology choices.

In its initial scope, the conceptual model focuses on **adult patients with solid tumours**, considering **one cancer condition at a time**, in order to limit modelling complexity and ensure feasibility in early iterations.

This conceptual backbone is refined through the [Logical Model](https://build.fhir.org/ig/hl7-eu/cancer-common/logicalmodels.html) and, within this Implementation Guide, explicitly mapped to both [HL7 FHIR](https://build.fhir.org/ig/hl7-eu/cancer-common/fhirmodelmap.html) and [OMOP](https://build.fhir.org/ig/hl7-eu/cancer-common/omopmodelmap.html), demonstrating how a single shared model can support interoperable representations across different technical ecosystems.

### Overview

At a high level, the European Cancer Common Conceptual Model represents how a **Cancer Patient** is affected by one or more **Cancer Conditions**, how each condition is characterised at diagnosis, staged, treated, evaluated, and how it evolves over time.

The model captures the core structure of a typical cancer journey, including:
*	the patient as the subject of care;
* the diagnosis of one or more cancer conditions;
* staging assessments associated with each condition;
*	treatments administered with an explicit intent;
*	evaluation of treatment response based on clinical evidence;
*	clinical progression of the disease over time;
*	follow up information summarising the most recent known patient status.

This overview introduces the main building blocks of the model before presenting the complete conceptual representation.

<div style="text-align:center;">
  <p></p>
    <figure>
      <a href="conceptual-overview.png" target="_blank">
        <img src="conceptual-overview.png" alt="Conceptual Overview of the model" style="width:95%; cursor:zoom-in;"/>
      </a>
      <br/>
      <figcaption>
        <strong>Figure 1: Overview of the Cancer Common Conceptual Model [click to zoom]</strong>
      </figcaption>
    </figure>
  <p></p>
</div>

### Overview of the conceptual Entities

#### CancerPatient

The **CancerPatient** represents the subject of care.

A patient may be affected by **one or more cancer conditions** over time, potentially at different points in their life.

The patient is associated with overall follow up information, including the **Last Follow up**, which captures the most recent known clinical status.

#### CancerConditionAtDiagnosis

A **CancerConditionAtDiagnosis** represents a cancer diagnosis asserted for a patient at a specific point in time and represent the start point of the cancer journey.

It captures key diagnostic characteristics such as body site, histology, grade, and the asserted dates, based on available clinical evidence (e.g. imaging, biopsy).

Each cancer condition:
*	is associated with one or two **CancerStages** (at least the Clinical Stage);
*	may be treated by one or more **CancerTreatments**;
*	may evolve over time through **ClinicalCancerProgression**.

Although the model supports multiple cancer conditions for the same patient, each condition is considered independently within the model.

#### CancerStage

A **CancerStage** represents the staging assessment associated with a cancer condition.

A stage can be:
*	**clinical**, defined based on one or more imaging assessments;
*	**pathological**, defined based on surgical procedures.

Multiple stage assessments may be associated with the same cancer condition as new information becomes available. 

#### CancerTreatment

A **CancerTreatment** represents the intervention, or combination of interventions, administered to treat a cancer condition.

Each treatment is characterised by an explicit **intent** (e.g. curative, palliative) and may be applied alone or in combination with other treatments.

The model distinguishes four main cancer treatment categories:
*	**Surgery**
*	**Radiotherapy**
*	**SystemicTreatment**
*	**ActiveSurveillance**

A cancer condition can be associated with one or more treatments over time.

#### OverallCancerTreatmentResponse

The **OverallCancerTreatmentResponse** represents the evaluation of how a cancer condition responds to treatment.

Response assessments are based on clinical evidence such as imaging, laboratory tests, or biomarkers and reflect the outcome of a given treatment or treatment phase in relation to the cancer condition.

#### ClinicalCancerProgression

**ClinicalCancerProgression** describes how a cancer condition evolves over time.

It captures disease states such as stability, progression, recurrence, or remission, together with the date and the basis of assessment.

A cancer condition may evolve through **one or more progression events** over time.

#### Follow-up

The **LastFollowUp** captures the most recent follow up information available for the patient.

It provides a summary view of the latest known clinical status within the context of the overall cancer journey.

### Detailes Conceptual Model

This section presents the **complete conceptual representation** of the first release of the European Cancer Common Conceptual Model, including all concepts, attributes, and relationships.

<div style="text-align:center;">
  <p></p>
    <figure>
      <a href="conceptual-1.png" target="_blank">
        <img src="conceptual-1.png" alt="Cancer Model" style="width:95%; cursor:zoom-in;"/>
      </a>
      <br/>
      <figcaption>
        <strong>Figure 2: European Cancer Common Conceptual Model [click to zoom]</strong>
      </figcaption>
    </figure>
  <p></p>
</div>

The detailed conceptual diagrams adopt a set of **representation conventions** aimed at balancing clarity for clinicians, researchers, and domain experts with sufficient precision to support downstream modelling activities.

In the conceptual diagrams:
*	**Black rectangles with rounded corners** represent **Concepts**
*	**Black rectangles with dotted edges** represent **Attributes**
*	**Black rectangles** represent possible **Values** of attributes
*	**Blue shapes** represent **Events** and **Documents**

Events represent all procedures, encounters, or episodes of care in which a cancer patient participates as subject (e.g. outpatient visits, surgery, imaging examinations, laboratory tests).
Documents represent medical reports produced during events and digitally signed by a doctor, physician, or clinician.

Events and documents are included to reflect real world EHR artefacts and to support traceability of information, while keeping the conceptual model focused on cancer domain concepts rather than on workflow or document management.

The conceptual representation is also organised around the notion of a typical cancer journey. In addition to defining concepts and relationships, the model captures how cancer related information unfolds over time, from diagnosis through treatment, response evaluation, disease progression, and follow up. 

To support understanding and validation of the model, a reference typical [cancer patient journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html) has been defined, together with an [illustrative example](https://build.fhir.org/ig/hl7-eu/cancer-common/journey-data-evolution.html) showing how the conceptual entities can be instantiated and populated over time. This example is intended to make the model easier to understand for clinicians, researchers, and implementers, and to demonstrate its applicability in real world scenarios.

A detailed description of the typical [cancer patient journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html) and an [example](https://build.fhir.org/ig/hl7-eu/cancer-common/journey-data-evolution.html) of model population are provided in the dedicated pages, which complement the conceptual and logical representations presented in this Implementation Guide.

### Modelling assumptions and design considerations

The following modelling assumptions apply to the first version of the European Cancer Common Conceptual Model:
*	During the discussions, additional concepts were identified but intentionally excluded from the first release of the model. These concepts are documented separately and represent candidate areas for future extensions.
*	The **blue shapes (events and documents)** are not considered core conceptual entities and are therefore not the focus of the model design. They are included because: 
    *	they may be available (even if not systematically) in electronic format in EHR systems;
    *	they help understand the **source of information** or the **basis of a clinical decision**.
*	To avoid unnecessary complexity, in the conceptual diagrams the blue shapes are connected only to the main concept or attribute they inform, in order to indicate possible EHR sources. 
*	Although the conceptual model supports concurrent cancer conditions, to limit modelling complexity in the initial phase **only one cancer condition at a time is considered**.

### Temporal representation

For the first release of the model, all temporal information is explicitly preserved.

Dates are collected for all entities, and new instances are created for each time point, rather than overwriting existing ones, even when observed values remain unchanged.

This approach ensures correct longitudinal representation of the cancer journey and supports retrospective analyses, research use cases, and temporal reasoning.

### Concepts Excluded from the First Release

During the working group discussions, additional concepts were identified but intentionally excluded from the first release of the model. These concepts represent **candidate areas for future extensions**.

Examples include:
*	Treatment Plan
*	Clinical Trials participation
*	Quality of Life (QoL) and Patient Reported Outcome Measures (PROMs)
*	Adverse Events, Late Effects, and Toxicities
*	Risk and Environmental factors, Genomic Predisposition, Familiarity
*	Genomics and advanced Biomarker models

These topics require dedicated scoping and discussion and will be addressed in future iterations of the model.

### From Conceptual Model to Logical Model and Implementations

The conceptual model does not stand alone.
Together with the [Logical Model](https://build.fhir.org/ig/hl7-eu/cancer-common/logicalmodels.html), it forms a shared backbone that supports consistent and systematic mappings across standards.

Within this Implementation Guide:
*	a detailed definition of all concepts and attributes is provided in the [Glossary](https://build.fhir.org/ig/hl7-eu/cancer-common/glossary.html) page;
*	the [cancer patient journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html) page describes a reference cancer journey used to guide and validate the conceptual model.
*	the [example of model population](https://build.fhir.org/ig/hl7-eu/cancer-common/journey-data-evolution.html) page provides an illustrative example of how the conceptual and logical models can be instantiated over time.
*	the [Logical Model](https://build.fhir.org/ig/hl7-eu/cancer-common/logicalmodels.html) refines the concepts introduced here by defining entities, attributes, relationships, and cardinalities;
*	mappings of the shared backbone to [HL7 FHIR](https://build.fhir.org/ig/hl7-eu/cancer-common/fhirmodelmap.html) are documented;
*	mappings of the same backbone to **OMOP** are documented to support research and data reuse.

By presenting these mappings within a single Implementation Guide, ECCDM demonstrates how a common semantic foundation can support interoperability across different technical ecosystems without redefining the underlying meaning of the data.