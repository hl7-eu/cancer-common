Instance: ClinicalCancerProgression4-Example
Title: "Clinical Cancer Progression 4 Example"
Description: "Example clinical cancer progression documenting loco-regional recurrence on 2019-08-31."
InstanceOf: ClinicalCancerProgression
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* diseaseStatus.text = "Recurrence"
* assertedDate = "2019-08-31"
* extentType.text = "Loco-regional"
* locoRegionalSites.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* locoRegionalSites.coding[0].code = #C77.1
* locoRegionalSites.coding[0].display = "Intrathoracic lymph nodes"
