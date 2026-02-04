Logical: ActiveSurveillance
Id: ActiveSurveillance
Title: "Active Surveillance"
Description: "Active Surveillance logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet Active Surveillance)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "The reference to CancerCondition is limited to the CancerCondition(AtDiagnosis) because ActiveSurveillance is discontinued if a ClinicalCancerProgression occurs, at which point a different treatment strategy is initiated. nan"
* startDate 1..1 dateTime "StartDate"
* endDate 0..1 dateTime "EndDate"
