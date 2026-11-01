Logical: Radiotherapy
Id: Radiotherapy
Title: "Radiotherapy"
Description: "Logical model representing a radiotherapy treatment course administered to the patient, including intent, timing, and anatomical target. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet Radiotherapy)."
Characteristics: #can-be-target

* obeys rt-1
* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) receiving radiotherapy."
* cancerConditionAtDiagnosisReference 1..1 CancerConditionAtDiagnosis "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at diagnosis targeted by radiotherapy."
* clinicalCancerProgressionReference 0..1 ClinicalCancerProgression "ClinicalCancerProgresionReference"
* clinicalCancerProgressionReference ^definition = "Reference to the clinical progression event, if radiotherapy is delivered in response to progression."
* clinicalCancerProgressionReference ^comment = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression."
* intent 1..1 CodeableConcept "Intent"
* intent ^definition = "Radiotherapy intent (Definitive/curative vs Palliative)."
* intent ^comment = "Choice: Definitive | Palliative"
* startDate 1..1 dateTime "StartDate"
* startDate ^definition = "Start date of the radiotherapy course."
* endDate 0..1 dateTime "EndDate"
* endDate ^definition = "End date of the radiotherapy course (may be missing while ongoing)."
* endDate ^comment = "It might not be available while the radiotherapy is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death."
* bodySite 1..* CodeableConcept "BodySite"
* bodySite ^definition = "Anatomical site(s) targeted by radiotherapy."
* setting 0..1 CodeableConcept "Setting"
* setting ^definition = "Strategic timing/setting of radiotherapy (e.g. neoadjuvant, adjuvant, concomitant, alone)."
* setting ^comment = "Choice: Alone |  Preoperative/Neoadjuvant | Postoperative/Adjuvant | Concomitant"


Invariant: rt-1
Description: "If endDate is present, it should be greater than or equal to startDate."
Severity: #warning
Expression: "endDate.empty() or endDate >= startDate"
