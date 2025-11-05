
### The European Cancer Common Conceptual Model

Based on this timeline diagram reported in Figure 1 and Figure 2 of the [Cancer Journey](journey.html), and on the discussions had on it, and taking inspiration from mCODE, the first version of European Cancer Common Conceptual Model is under development. 

In detail, the European Cancer Common Conceptual Model defines the minimum, extensible, non-exhaustive set of concepts (and their relationship) needed to represent a typical cancer journey starting from the diagnosis considering the disease progression, the treatment and its response evaluation, and patient follow-up including outcomes to support primary and secondary data use. As mentioned, in the first period the activity will be **focused only on solid cancer on adult patients**.


The Figure below presents the draft on which we are working in a non-formal way, easily understandable also by clinicians, doctors and researchers.

In details:

* Black rectangles with rounded corners represent Concepts
* Black rectangles with dotted edges represent Attributes
* Black rectangle represent possible Values for the Attributes  
* Blue shapes represent Events that are reported in Documents.

Events represent all the possible procedures/encounters/episodes of care where a cancer patient is participating as subject (e.g. a visit, a surgery, a laboratory test ect). Documents represent medical reports produced during the Events and digitally signed by a doctor/physician/clinician. 



<div>
  <p></p>
  <figure>
    <img src="conceptual-1.png" alt="Cancer Model" width="50%"/>
    <figcaption><strong>Figure 1: the first version of European Cancer Common Conceptual Model under development</strong></figcaption>
  </figure>
  <p></p>
</div>


Please note:

At the present we have focused on the first phases of the disease so the diagnosis and the first treatment (so we don't have already considered the cancer extent).
For some Concepts some Attributes which characterize them or are relevant were defined during the discussion but in the design of the logical model some others could be defined.
Considering that the model can be used for secondary use, where the data available can be the only ones related to the specific use case, study, research, it is not possible to consider each concept as mandatory, so most of them will be optional, but if present, all the date element must be provided.
During the discussion other possible Concepts were cited, but will not be part of the first release of the model. Please see Table 2.
The blue shapes will not be part of Concepts that will be the focus of the model design, but the were introduced because:
they could be available (even if not usually) in electronic format in an EHR
it is useful to understand the base of a decision or the source of an information.
For this reason, and to not complicate the model, in Figure 3, the blue shapes are connected with blue arrows only with the main Concept or the Attribute that can depend on them to understand the possible EHR source. However in Table 1 are reported all the possible connections between Concepts and the blue shapes.

### Overview

The figure below provides an overview of the main concepts and of their relationships

<div>
  <p></p>
  <figure>
    <img src="static-model-overview.png" alt="Cancer Model Overview" width="50%"/>
    <figcaption><strong>Figure 2: Overview of the Cancer Common Conceptual Model under development</strong></figcaption>
  </figure>
  <p></p>
</div>

### Glossary

A description of the concepts is provided in the [Glossary page](glossary.html)


