Logical: Surgery
Id: Surgery
Title: "Surgery"
Description: "Surgery logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet Surgery)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* clinicalCancerProgressionReference 0..1 Reference(ClinicalCancerProgression) "ClinicalCancerProgressionReference"
* clinicalCancerProgressionReference ^definition = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression. nan"
* intent 1..1 CodeableConcept "Intent"
* intent ^definition = "Choice: Definitive | Palliative"
* date 1..1 dateTime "Date"
* bodySite 1..* CodeableConcept "BodySite"
