A patient’s cancer journey is a longitudinal sequence of events that starts with presentation and evidence gathering, continues through condition assertion and staging, proceeds to treatment (often in overlapping episodes), and is followed by ongoing assessment of response and disease status. Capturing **dates** consistently for each step is essential so the timeline can be accurately reconstructed for care and research.


*Text generated from the picture: to be checked*

<div>
  <p></p>
  <figure>
    <img src="journey-1.png" alt="Cancer Journey" width="70%"/>
    <figcaption><strong>Figure 1: the typical cancer journey (part 1)</strong></figcaption>
  </figure>
  <p></p>
</div>
<div>
  <p></p>
  <figure>
    <img src="journey-2.png" alt="Cancer Journey" width="70%"/>
    <figcaption><strong>Figure 2: the typical cancer journey (part 2)</strong></figcaption>
  </figure>
  <p></p>
</div>


### Foundations

* **Patient & Demographics**
  The journey is anchored to the **Patient**, including demographics (e.g., sex, birth date/year) and **Comorbidities**. Demographics and comorbidities may **change over time** and should be versioned accordingly.

### Presentation & Early Evidence

* **Visit (initial encounter)** initiates the work-up.
* **Evidence acquisition** begins: **Lab results** and **Imaging/Evidence** provide the first clinical signals.
* **Biopsy** may be performed to obtain histology.

> Record the **effective dates** of each evidence item; these dates will later support condition assertion, staging, and treatment decisions.

### Cancer Condition Assertion

* **Cancer Condition** marks the start of the cancer journey and must include:

  * **Histology Behaviour** (cell type + behavior) — **does not change** over time.
  * **Body Site** (first detected location) — **does not change** over time.
  * **Tumour Grade** (biologic aggressiveness) — **does not change** over time.
  * **Asserted Date** — the first date the condition is documented (must tie to a report such as Visit, Biopsy, Surgery, Imaging, Biomarker, Lab Report).
  * **Base of Diagnosis** — procedure type underpinning assertion (e.g., Biopsy, Imaging, Lab).
  * Optional: **Imaging Type** / **Biomarker Type** used for detection.

**Lifecycle rule:**

* A truly **new, unrelated cancer** → create a **new Cancer Condition**.
* Extension/progression of the **same cancer** → **update** staging and **Disease Status** on the original condition.

> The pair **Histology Behaviour + Body Site** identifies a Cancer Condition instance.

### Staging & Disease Characterization

* **Clinical Stage** (derived mainly from imaging and clinical evidence).
* **Pathological Stage** (derived from surgery/histopathology).
* **Disease Extent** can be represented by stage or other classification; it may evolve.
* **Disease Status** (e.g., progression, partial/complete remission, recurrence) reflects the **evolution of the Cancer Condition over time**, typically evaluated at or around Visits using current evidence.

**Temporality:**

* Stages can be **updated** as new evidence becomes available (e.g., after surgery for pathological stage).
* Disease Status is **time-stamped** assessments that may recur along the timeline.

### Treatment Planning & Treatment Episodes

* **Treatment** represents procedures/therapies defined to treat the Cancer Condition and has an **Intent**: **Definitive (curative)** or **Palliative**.
* Main treatment categories:

  * **Surgery** — characterized by a **procedure date** and **target side**.
  * **Active Surveillance** — **start** and **end** dates.
  * **Radiotherapy** — **start**, **end**, and **target side**.
  * **Drug Administration** — **start** and **end** (may be flagged **ongoing**, e.g., immunotherapy).

Treatments may be **concurrent** and are often grouped into a **treatment episode**. A single treatment can **evolve** (e.g., regimen changes), so maintain episode boundaries and versioning by dates.

> Optionally, a **Treatment Plan/Prescription** may exist (especially for radiotherapy/drug therapy); while not in scope for v1, it can later document intended vs. actual care.

### Monitoring & Follow-up

* Ongoing **Imaging/Evidence** collection provides objective measures during and after therapy.
* **Visits** anchor evaluations and decision points.
* **Adverse Events/Late Effects/Toxicities** may occur and should be captured with occurrence dates and severity when available (often requires hospitalization data).
* **PROMs/QoL** (if collected) give a patient-centered view of outcomes.

### Treatment Response (per Treatment)

* **Treatment Response** is the standard measure of how well a **specific Treatment** worked, determined by a clinician during a **Visit** and **based on Evidence** (imaging, labs, biomarkers). Typical values:

  * Progression, Stable Disease, Partial Remission, Complete Remission, Recurrence.
* Must include:

  * **Based on** (evidence type).
  * **Date** (visit date or evidence date; always tied to a documented report).

> **Do not conflate** Treatment Response with Disease Status:
>
> * **Treatment Response** evaluates the **effect of a given treatment**.
> * **Disease Status** summarizes the **overall condition trajectory** over time.

---

### Time & Instance Management (what changes vs. what stays fixed)

* **Fixed over time for a given Cancer Condition:** Histology Behaviour, Body Site, Tumour Grade, Asserted Date (historical fact).
* **Evolves over time:** Disease Status, Cancer Stage (clinical/pathological), Comorbidities, Treatments (episodes/regimens), Evidence (labs/imaging), Adverse Events, PROMs.
* **Create a new instance when:** a new unrelated primary cancer is diagnosed (new Condition); a new treatment episode begins that is distinct in intent/regimen; a new response assessment is performed.
* **Update an existing instance when:** staging is refined; status changes for the same condition; demographics/comorbidities change; a treatment continues with adjustments within the same episode.
