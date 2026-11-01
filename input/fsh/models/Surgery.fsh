Logical: Surgery
Id: Surgery
Title: "Surgery"
Description: "Logical model representing a surgical treatment episode delivered to the patient for cancer management. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet Surgery)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) undergoing the surgery."
* cancerConditionAtDiagnosisReference 1..1 CancerConditionAtDiagnosis "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at diagnosis targeted by the surgery."
* clinicalCancerProgressionReference 0..1 ClinicalCancerProgression "ClinicalCancerProgressionReference"
* clinicalCancerProgressionReference ^definition = "Reference to the clinical progression event, if surgery is performed in response to progression."
* clinicalCancerProgressionReference ^comment = "It shall not be provided at the time of diagnosis, but shall always be provided in the event of ClinicalCancerProgression."
* intent 1..1 CodeableConcept "Intent"
* intent ^definition = "Surgical intent (Definitive/curative vs Palliative)."
* intent ^comment = "Choice: Definitive | Palliative"
* date 1..1 dateTime "Date"
* date ^definition = "Date when the surgical procedure was performed."
* bodySite 1..* CodeableConcept "BodySite"
* bodySite ^definition = "Anatomical site(s) where the surgery was performed."