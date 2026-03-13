The **HL7 Europe Cancer Common Data Model (ECCDM)** initiative was launched based on experience gained through participation in several European and national initiatives addressing cancer data for different purposes, including clinical care, research, analytics, and secondary use.

Across these initiatives, a **recurring observation** emerged: although projects focus on different cancer domains, populations, and use cases, they share a common need to represent a consistent set of core concepts and relationships related to cancer. At the same time, the concrete data models adopted by individual projects are often heterogeneous, tailored to specific objectives, and difficult to reuse outside their original context.

Several European projects and initiatives (e.g. IDEA4RC, PanCareSurPass, FLUTE, ect), as well as shared datasets such as MEDOC (Minimal Essential Description of Cancer), have highlighted the value of identifying a minimum common core of cancer-related information. MEDOC, in particular, demonstrated that a limited and shared set of elements can be defined across institutions and countries, while still supporting meaningful reuse.

ECCDM builds on this experience by extending the concept of a shared dataset into a structured data model, where not only data elements but also their relationships and longitudinal evolution are explicitly represented.

A key motivation for ECCDM is the recognition that **defining datasets alone is not sufficient to support interoperability and reuse**. While datasets list which data elements should be collected for a given purpose, a **data model** provides a **structured representation** of **concepts**, **relationships**, and **temporal aspects** that are essential to consistently reconstruct and interpret a cancer history over time.

For this reason, ECCDM adopts a model-driven approach, starting from a conceptual representation of the cancer domain and progressing towards a logical model that can be adopted by different technical specifications.

The ECCDM initiative explicitly considers both **primary** and **secondary use of cancer data**. Secondary use (e.g. research, analytics, AI model training) depends on the availability and quality of data captured during primary care. At the same time, understanding secondary-use requirements is essential to identify which information should be collected at the point of care in a structured and reusable way.

ECCDM therefore treats primary and secondary use as a single **continuum**: secondary-use needs inform the definition of minimum requirements for primary data capture, improving interoperability and enabling reliable reuse without extensive post-hoc transformations.

In the European context, this challenge is further amplified by the **coexistence** of **different standards** and technical ecosystems. OMOP is widely adopted for research and secondary use of data, while HL7 FHIR is increasingly used for data exchange and interoperability. Mapping between these standards is often complex and addressed on a project-by-project basis.

ECCDM addresses this gap by defining a shared **conceptual** and **logical backbone** that can support consistent **mapping** between **different standard** representations, enabling alignment between HL7 FHIR-based primary data exchange and OMOP-based secondary use.

The initial phase of ECCDM focuses on defining a typical cancer journey, guided by extensive discussions with clinicians during initiatives such as IDEA4RC. To limit complexity, the first iteration of the model focuses on **adult patients** with **solid tumours**, covering key phases such as diagnosis, disease progression, treatments, response evaluation, and follow-up including outcomes.

This scope is intentionally limited and incremental, with the expectation that the model will be extended over time based on experience and emerging requirements from European and national initiatives addressing specific cancer domains.

Finally, ECCDM is informed by existing international specifications, such as the **HL7 US mCODE Implementation Guide**, which provides valuable implementation experience in oncology. ECCDM, however, addresses European interoperability requirements through a platform-independent, model-driven approach, while remaining open to future alignment and collaboration with international initiatives.