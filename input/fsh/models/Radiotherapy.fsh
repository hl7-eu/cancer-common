Logical: Radiotherapy
Id: Radiotherapy
Title: "Radiotherapy"
Description: "Radiotherapy logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet Radiotherapy)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* clinicalCancerProgresionReference 0..1 Reference(ClinicalCancerProgression) "ClinicalCancerProgresionReference"
* clinicalCancerProgresionReference ^definition = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression. nan"
* intent 1..1 CodeableConcept "Intent"
* intent ^definition = "Choice: Definitive | Palliative"
* startDate 1..1 dateTime "StartDate"
* endDate 0..1 dateTime "EndDate"
* endDate ^definition = "It might not be available while the radiotherapy is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death nan"
* bodySite 0..* CodeableConcept "BodySite"
* setting 0..1 CodeableConcept "Setting"
* setting ^definition = "Choice: Alone | Neo-adjuvant | Adjuvant | Concomitant"
