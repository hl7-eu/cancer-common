### European Cancer Common Data Model

The European Cancer Common Data Model defines the **minimum, extensible, non-exhaustive set of concepts** (and their relationship) needed to represent and reconstruct a **typical cancer journey**. 

In this activity, these are the key principles:

* The model will be agnostic to the type of cancer
* The model will be usable across different use cases
* The design will leverage on the experience of the European projects working on secondary use: the model will support both primary and secondary use of data as research and model training
* The design will take into account the availability and usability of reliable data in the EHR systems
* The design will use an incremental approach: the activities will start on a small minimal core set that will be shared with other European and national initiatives to evaluate and then it will be extended/enhanced through iterations.


In the first phase of the activities, the design is focused on the definition of a typical cancer journey, guided by the experience derived by long discussions with the clinicians during the IDEA4RC project, starting from the diagnosis considering the disease progression, the treatment and its response evaluation, and patient follow-up including outcomes. To limit the complexity, in the first period of activity the model will be focused only on solid cancer on adult patients.

The activities have been started from the design of the European Cancer Common Conceptual Model.

A conceptual model is an high level platform independent model, that defines a broad and simplified view of the data. Therefore after the finalisation of The European Cancer Common Conceptual Model, it  will be adopted to define a logical model, that is a more detailed model (which remains platform independent) where each concept is mapped in the corresponding entity represented by a table with attribute that are needed to define if and where the relationship between the entities are fully described. As mentioned, this logical model could be then adopted by different SDOs (Standard Development Organizations) to formalize it in its specification: for Example HL7 EU will adopt it to create the HL7 Europe Cancer Common FHIR Implementation Guide. But sharing the same conceptual and logical model, it could be possible to map data from one standard specification (eg. HL7 FHIR) to another (e.g. OMOP).