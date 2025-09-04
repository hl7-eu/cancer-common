The following figure describe a typical cancer journey.

 Please note that we will create another version of it reporting the Concepts defined in the first version of the European Cancer Common Conceptual Model defined in the next chapter and we will describe it in detail. We decided to report the timeline diagram in this preliminary version because it way the results of the track and the base on which we defined the conceptual model.


*Text generated from the picture: to be checked*

<div>
  <p></p>
  <figure>
    <img src="journey-1.png" alt="Cancer Journey" width="50%"/>
    <figcaption><strong>Figure 1: the typical cancer journey (part 1)</strong></figcaption>
  </figure>
  <p></p>
</div>

The cancer journey is a **longitudinal sequence** of patient-related events, diagnostic processes, and therapeutic interventions that together define the continuum of oncological care. This journey is represented as a timeline, where each step contributes to building a structured record suitable for both **clinical practice** and **secondary use** (e.g., research, registries, quality monitoring).

### Patient and Demographics

Every journey begins with the **patient** and their **demographic information**, forming the foundational context for all subsequent data elements.

### Initial Encounter and Diagnostics

* **Visit (Date 1):** The patient enters the healthcare system, typically with symptoms or clinical suspicion.
* **Lab Results & Imaging (Dates 2–3):** Diagnostic procedures such as laboratory tests and imaging are performed to gather evidence.
* **Biopsy:** Tissue analysis may be performed to establish histological confirmation of cancer.

### Staging and Disease Characterization

* **Clinical Stage (Date 4):** Based on clinical findings and imaging, the initial stage of the disease is assigned.
* **Pathological Stage (Date 5):** Following biopsy or surgery, histological results refine the staging.
* **CancerCondition Resource:** The cancer condition is formally asserted with attributes such as body site (topography), histology/morphology, and behavior.
* **Disease Extent and Status (Date 6 onward):** Disease extent can be defined in terms of stage or other classification systems, and disease status (e.g., stable, progressive, recurrent) provides a temporal measure of progression.

### Treatment Phase

* **Treatment Episodes:** Treatments are grouped into episodes that may include:

  * **Active surveillance**
  * **Drug administration (systemic therapy)**
  * **Surgery**
  * **Radiotherapy**
* Multiple treatments can occur concurrently and are tracked across time.

### Monitoring and Follow-up

* **Imaging/Evidences (Date 7):** Subsequent imaging and evidence collection are performed to monitor disease.
* **Treatment Response (Date 8):** Outcomes of treatment are evaluated to assess efficacy.
* **Adverse Events:** Any complications or negative effects are captured alongside treatments to provide a complete safety profile.

### Longitudinal Nature

The journey reflects the **iterative and cyclical** nature of cancer care:

* Initial diagnosis leads to staging and treatment.
* Treatments are followed by assessments of response, possibly requiring further interventions.
* Disease extent and status evolve over time, forming a timeline that enables **data reuse across contexts** (clinical care, research, public health).





*Text generated from the picture: to be checked*


A patient’s cancer journey typically unfolds as a sequence of clinical encounters, diagnostic evaluations, and therapeutic interventions that together form the continuum of care. 
The timeline below illustrates the major events and data points that are relevant for both clinical practice and secondary use in research.

<div>
  <p></p>
  <figure>
    <img src="journey-2.png" alt="Cancer Journey" width="50%"/>
    <figcaption><strong>Figure 2: the typical cancer journey</strong></figcaption>
  </figure>
  <p></p>
</div>


* **Initial Encounter (Visit)**
  The journey often begins with a patient visit, where clinical suspicion is raised, and initial assessments are performed. This sets the stage for diagnostic testing.

* **Diagnostic Phase (Lab Results, Imaging/Evidences)**
  Laboratory analyses and imaging play a central role in establishing the diagnosis and characterizing the disease. These findings contribute to defining the patient’s **disease status** (e.g., initial diagnosis, recurrence) and **disease extent** (stage, spread, severity).

* **Defining Disease Status and Extent**
  Disease status (such as recurrence) and extent are determined from diagnostic evidence. These elements are time-bound, with a start date and end date for recording disease progression or treatment response.

* **Therapeutic Interventions (Procedures and Treatments)**
  Interventions such as surgery, radiotherapy, and systemic therapies are represented as discrete events.

  * **Surgery events** are further detailed into specific procedures (e.g., procedure X and procedure Y), which are recorded individually.
  * **Radiotherapy episodes** are often documented as continuous periods of treatment rather than isolated events.
  * **Anti-cancer treatments** (chemotherapy, targeted therapies, immunotherapies) are captured with both intended and administered regimens.

* **Outcome Monitoring (PROMs)**
  Patient-Reported Outcome Measures (PROMs) provide complementary insights into quality of life, treatment burden, and overall well-being. These are increasingly important for value-based care and patient-centered outcomes.

* **Longitudinal Nature**
  Each of these elements is recorded at defined time points (e.g., Date 9–16 in the illustration), creating a longitudinal record of the patient’s journey. This record enables both continuity of care across settings and secondary use of data for research and public health.

