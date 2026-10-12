### Scope

<div class="callout-wrapper">
  <div class="callout-box contextual-box">
    <strong>Contextual information</strong>
    This page provides background and orientation for the guide. It supports understanding of the proposed model, but it is not itself a model artefact or an implementation specification submitted for evaluation.
  </div>
</div>

The **HL7 Europe Cancer Common Data Model (ECCDM)** initiative aims to define a European common data model for cancer: a **minimal**, **shared**, and **extensible set of concepts** and **relationships** capable of representing cancer-related information across different contexts and use cases.

The scope of the initiative is to define a model that is **agnostic to cancer type** and **independent from specific technical standards**, providing a **common conceptual and logical backbone** that can be progressively extended over time.

The scope of this Implementation Guide is to document this common model and to support its implementation by providing mappings of the model to **HL7 FHIR** and to **OMOP**, enabling interoperability between primary data exchange and secondary data use in research contexts.

By defining consistent concepts, relationships, and longitudinal structures, the model enables, among other outcomes, the reconstruction of a typical cancer journey.

### How to Read This Guide

This guide is organised progressively, from the general rationale of the model to its logical representation and implementation-oriented artefacts.

Readers are encouraged to start from the **Introduction** section, which describes the scope, background, challenges, and reference materials for the European Cancer Common Data Model.

The **Functional** section presents the model from a conceptual and clinical perspective. It describes the main concepts, their relationships, the cancer patient journey, and the evolution of data over time. This section is intended to help readers understand what the model represents and why the selected concepts are included.

The **Logical** section provides the formal logical representation of the model. It defines the entities, attributes, relationships, cardinalities, and constraints that structure the European Cancer Common Logical Model. It also includes a worked example of how the logical model can be instantiated along a cancer patient journey.

The **Implementation** section provides implementation-oriented material, including mappings from the logical model to HL7 FHIR and OMOP. This part of the guide is informative and included to show the expected direction of future work. The FHIR profiling work, detailed FHIR artefacts, and implementation mappings are expected to evolve in subsequent iterations.

The **Artifacts** section contains the generated FHIR artefacts associated with this guide. At this stage, these artefacts should be interpreted in the context of the ongoing implementation work and not as a final normative specification.

The **Functional** and **Logical** sections contain the proposed model content for review and evaluation in this publication. The **Home** and **Introduction** pages provide contextual information supporting that review. The **Implementation** section is highlighted in grey to indicate future implementation-oriented content that is informative only at this stage.

### Purpose

This project aims to define a **minimal**, **extensible**, and **non-exhaustive** European cancer data model that is:

- Agnostic to the type of cancer;  
- Usable across different use cases;  
- Leveraging experiences of European projects working with both primary and secondary use of data;
- Taking into account the availability and usability of reliable information in EHR systems.

The model is intended to be:
- Inclusive and cross-cutting, transversal to different cancer domains and purposes of use;
- Community-driven, considering the needs of different communities;
- Incremental, starting from a minimal core set and extending the model through subsequent iterations.

At the same time, ECCDM explicitly addresses the relationship between **primary and secondary use of cancer data**. Secondary use (e.g. research, analytics, AI) depends on the quality and structure of data captured during primary care. Understanding secondary-use requirements is therefore essential to identify which information should be collected during primary care in a consistent and reusable way.

ECCDM treats primary and secondary use as a single continuum: secondary-use needs inform the definition of minimum requirements for primary data capture, enabling reliable reuse without redefining data semantics at later stages.

### Relationships and References

ECCDM builds on experience gained across multiple European and national initiatives addressing cancer data.

Inputs include several European projects (e.g. IDEA4RC, PanCareSurPass, FLUTE, etc.), as well as shared datasets and initiatives such as MEDOC (Minimal Essential Description of Cancer). Complementary national initiatives, such as OSIRIS, have also contributed relevant experience and requirements.

ECCDM is informed by existing international specifications, including the HL7 US mCODE Implementation Guide, which provides valuable implementation experience in oncology. ECCDM, however, addresses European interoperability needs through a model-driven approach based on conceptual and logical foundations.

In the European context, OMOP is widely adopted for research and secondary use, while HL7 FHIR is increasingly used for data exchange and interoperability. ECCDM is intended to provide a shared foundation that supports both representations and enables systematic mapping between OMOP and FHIR.

The development of the European Cancer Common Data Model has been documented through the HL7 Europe project workspace on Confluence. The Confluence space collects working materials, discussions, intermediate decisions, and supporting documentation produced during the collaborative development of the model.

This Implementation Guide represents the formal publication view of the work, while the Confluence space provides additional project context and traceability of the modelling process.

Project workspace: [Cancer Common Model Project - Edition 1](https://confluence.hl7.org/spaces/HEU/pages/281282385/Cancer+Common+Model+Project+Edition+1)

### Example Scenarios

Example scenarios supported by ECCDM include:
- A multidisciplinary cancer team retrieves cancer-related data to assess the current diagnosis;
- Cancer data is stored in a research warehouse for use in various research projects;
- Representing cancer-related information consistently across projects and care settings;
- Enabling structured primary data capture that supports downstream research and secondary reuse;
- Supporting alignment and mapping between HL7 FHIR-based data exchange and OMOP-based research infrastructures.
