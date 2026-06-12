Instance: SystemicTreatment1-Example
Title: "Systemic Treatment 1 Example"
Description: "Example chemotherapy treatment following the loco-regional recurrence."
InstanceOf: SystemicTreatment
Usage: #example

* subject = Reference(CancerPatient1-Example)
* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* clinicalCancerProgressionReference = Reference(ClinicalCancerProgression4-Example)
* intent.text = "Definitive"
* type.coding[0].system = "http://snomed.info/sct"
* type.coding[0].code = #367336001
* type.coding[0].display = "Chemotherapy (procedure)"
* startDate = "2019-09-10"
* endDate = "2019-12-16"
* ongoing = false
* setting.text = "Alone"
