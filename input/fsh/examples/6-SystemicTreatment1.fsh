Instance: SystemicTreatment1-Example
Title: "Systemic Treatment 1 Example"
Description: "Example chemotherapy treatment following the loco-regional recurrence."
InstanceOf: SystemicTreatment
Usage: #example

* subject = CancerPatient1-Example
* cancerConditionAtDiagnosisReference = CancerConditionAtDiagnosis1-Example
* clinicalCancerProgressionReference = ClinicalCancerProgression4-Example
* intent.text = "Definitive"
* type.coding[0].system = "http://snomed.info/sct"
* type.coding[0].code = #367336001
* type.coding[0].display = "Chemotherapy (procedure)"
* startDate = "2019-09-10"
* endDate = "2019-12-16"
* ongoing = false
* setting.text = "Alone"
