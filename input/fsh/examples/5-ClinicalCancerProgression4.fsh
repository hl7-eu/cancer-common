Instance: ClinicalCancerProgression4-Example
Title: "Clinical Cancer Progression 4 Example"
Description: "Example clinical cancer progression documenting loco-regional recurrence on 2019-08-31."
InstanceOf: ClinicalCancerProgression
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* diseaseStatus.text = "Recurrence"
* assertedDate = "2019-08-31"
* ExtentType.text = "Loco-regional"
* LocoRegionalSites.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* LocoRegionalSites.coding[0].code = #C77.1
* LocoRegionalSites.coding[0].display = "Intrathoracic lymph nodes"
