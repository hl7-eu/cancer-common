Logical: OverallCancerTreatmentResponse
Id: OverallCancerTreatmentResponse
Title: "OverallCancerTreatmentResponse"
Description: "OverallCancerTreatmentResponse logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet OverallCancerTreatmentResponse)."
Characteristics: #can-be-target

* cancerConditionReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerConditionReference"
* clinicalCancerProgressionReference 0..1 Reference(ClinicalCancerProgression) "ClinicalCancerProgressionReference"
* clinicalCancerProgressionReference ^definition = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression."
* treatmentResponseType 1..1 CodeableConcept "TreatmentResponseType"
* treatmentResponseType ^definition = "Choice: Progression | Stable Disease | Partial Remission | Complete Remission"
* date 1..1 dateTime "Date"
