Logical: ActiveSurveillance
Id: ActiveSurveillance
Title: "Active Surveillance"
Description: "Active Surveillance logical model from Cancer_Common_Logical_Model_20260408.xlsx (sheet ActiveSurveillance)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) under active surveillance."
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at diagnosis for which surveillance is applied."
* cancerConditionAtDiagnosisReference ^comment = "The reference to CancerCondition is limited to the CancerConditionAtDiagnosis because ActiveSurveillance is discontinued if a ClinicalCancerProgression occurs, at which point a different treatment strategy is initiated."
* startDate 1..1 dateTime "StartDate"
* startDate ^definition = "Start date of the active surveillance period."
* endDate 0..1 dateTime "EndDate"
* endDate ^definition = "End date of the active surveillance period (if concluded)."
* endDate ^comment = "It might not be available while the active surveillanceis still ongoing; however, an end date must eventually be recorded."