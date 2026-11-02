### Scope

The **HL7 Europe Cancer Common Data Model (ECCDM)** initiative aims to define a **European common data model for cancer**: a **minimal**, **shared**, and **extensible set of concepts** and **relationships** capable of representing **cancer-related information** across **different contexts** and **use cases**.

The scope of the initiative is to define a **model** that is **agnostic to cancer type** and **independent from specific technical standards**, providing a **common conceptual** and **logical** backbone that can be adopted across different implementations.

The scope of this Implementation Guide is to describe this common model and to support its implementation by providing **mappings** of the model to **HL7 FHIR** and to **OMOP**, explicitly addressing the coexistence of these standards in the European context, where HL7 FHIR is especially used for data exchange and interoperability and OMOP is widely adopted for research and secondary use of data.

By defining consistent concepts, relationships, and longitudinal structures, the model enables, among other outcomes, the reconstruction of a typical cancer journey.

### Content

This Implementation Guide provides:
- The description of the European Cancer Common Conceptual Model, a high-level, platform-independent model that defines a broad and simplified view of the cancer domain and its key concepts and relationships;
- The description of the European Cancer Common Logical Model, a more detailed but still platform-independent model, in which each concept is mapped to entities and attributes and relationships between entities are explicitly defined;
- Guidance on how the common conceptual and logical models can be adopted by different Standard Development Organizations (SDOs) to formalize technical specifications;
- The HL7 FHIR representation of the model, expressed through profiles and related artefacts;
- Documentation supporting the mapping of the common model to OMOP, enabling consistent secondary use of data for research and analytics based on the same shared foundation.

By sharing the same conceptual and logical model, this approach enables data to be mapped consistently from one standard specification (e.g. HL7 FHIR) to another (e.g. OMOP), supporting interoperability between primary data exchange and secondary data use.
