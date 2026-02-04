Logical: SystemicTreatment
Id: SystemicTreatment
Title: "SystemicTreatment"
Description: "SystemicTreatment logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet SystemicTreatment)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* cancerConditionReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerConditionReference"
* clinicalCancerProgresionReference 0..1 Reference(ClinicalCancerProgression) "ClinicalCancerProgresionReference"
* clinicalCancerProgresionReference ^definition = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression. nan"
* intent 1..1 CodeableConcept "Intent"
* intent ^definition = "nan Choice: Definitive | Palliative"
* type 1..1 CodeableConcept "Type"
* startDate 1..1 dateTime "StartDate"
* endDate 0..1 dateTime "EndDate"
* endDate ^definition = "It might not be available while the treatment is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death nan"
* setting 0..1 CodeableConcept "Setting"
* setting ^definition = "nan Choice: Alone | Neo-adjuvant | Adjuvant | Concomitant"
