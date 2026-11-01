Logical: OverallCancerTreatmentResponse
Id: OverallCancerTreatmentResponse
Title: "OverallCancerTreatmentResponse"
Description: "Logical model representing the overall assessment of the cancer’s response to one or more treatment episodes at a specific time point. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet OverallCancerTreatmentResponse)."
Characteristics: #can-be-target

* cancerConditionAtDiagnosisReference 1..1 CancerConditionAtDiagnosis "CancerConditionAtDiagnosisReference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at diagnosis for which overall response is assessed."
* clinicalCancerProgressionReference 0..1 ClinicalCancerProgression "ClinicalCancerProgressionReference"
* clinicalCancerProgressionReference ^definition =  "Reference to the clinical progression time point, if response is assessed during progression."
* clinicalCancerProgressionReference ^comment = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression."
* treatmentResponseType 1..1 CodeableConcept "TreatmentResponseType"
* treatmentResponseType ^definition = "Overall response category (e.g. progression, stable disease, partial/complete remission)."
* treatmentResponseType ^comment = "Choice: Progression | Stable Disease | Partial Remission | Complete Remission"
* date 1..1 dateTime "Date"
* date ^definition = "Date of the response assessment."