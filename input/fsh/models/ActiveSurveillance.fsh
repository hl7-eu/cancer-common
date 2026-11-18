Logical: ActiveSurveillance
Id: ActiveSurveillance
Title: "Active Surveillance"
Description: "Logical model representing an active surveillance strategy in which the patient is monitored over time without active treatment, prior to disease progression. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet ActiveSurveillance)."
Characteristics: #can-be-target

* obeys as-1
* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) under active surveillance."
* cancerConditionAtDiagnosisReference 1..1 CancerConditionAtDiagnosis "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at diagnosis for which surveillance is applied."
* cancerConditionAtDiagnosisReference ^comment = "The reference to CancerCondition is limited to the CancerConditionAtDiagnosis because ActiveSurveillance is discontinued if a ClinicalCancerProgression occurs, at which point a different treatment strategy is initiated."
* startDate 1..1 dateTime "StartDate"
* startDate ^definition = "Start date of the active surveillance period."
* endDate 0..1 dateTime "EndDate"
* endDate ^definition = "End date of the active surveillance period (if concluded)."
* endDate ^comment = "It might not be available while the active surveillanceis still ongoing; however, an end date must eventually be recorded."


Invariant: as-1
Description: "If endDate is present, it must be greater than or equal to startDate."
Severity: #error
Expression: "endDate.empty() or endDate >= startDate"
