This page illustrates how the entities and relationships defined in the conceptual model are instantiated and evolve over time along the cancer journey.

The purpose of this page is to show how the cancer journey is represented through the creation of multiple instances of core concepts at different moments in time, and how these instances are linked to each other to support a faithful reconstruction of the patient’s cancer history. The focus is therefore on temporal evolution and traceability, rather than on exhaustively describing all possible data elements.

In this representation, **concepts are not updated or overwritten**. Each clinically relevant moment is captured through the creation of a new instance reflecting the state of the disease, the patient, or a treatment at that specific point in time. This modeling approach enables a clear and unambiguous longitudinal interpretation of cancer data, supporting both care continuity and secondary use.

The clinical context and sequencing of events underpinning this data evolution are described in the [Cancer Patient Journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html) page.

To correctly interpret the content of this page, readers should therefore be familiar with the pages describing the [Conceptual Model](https://build.fhir.org/ig/hl7-eu/cancer-common/conceptualmodel.html) and the [Cancer Patient Journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html), which define the concepts and the narrative framework within which data evolve.

The following sections show how entities and relationships are instantiated at selected key moments of the cancer journey, using schematic representations based on the conceptual model to highlight temporal consistency and traceability.

### Diagnosis + First Treatment (Date 0 - 3)

<div>
  <p></p>
<figure>
    {% include CancerDataEvolution1.svg %}
    <figcaption><strong>Figure 1 Data evolution: Diagnosis + First Treatment (Date 0 - 4)</strong></figcaption>    
    <!-- <img src="CancerDataEvolution1.svg" alt="Cancer Model" width="70%"/>
    <figcaption><strong>Figure 1 Data evolution: Diagnosis + First Treatment (Date 0 - 4)</strong></figcaption> -->

</figure>
  <p></p>
 </div>

### Evidence + Overall Treatment Response (Complete Remission) (Date 4)


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

### Evidence + Follow-up Visit (Disease Evolution - Recurrence) and Second Treatment (Date 7 - 9)
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
