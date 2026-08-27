Instance: ClinicalCancerProgression6-Example
Title: "Clinical Cancer Progression 6 Example"
Description: "Example clinical cancer progression documenting metastatic progression on 2020-04-15."
InstanceOf: ClinicalCancerProgression
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* diseaseStatus.text = "Progression"
* assertedDate = "2020-04-15"
* ExtentType.text = "Metastatic"
* MetastaticSites.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* MetastaticSites.coding[0].code = #C40.1
* MetastaticSites.coding[0].display = "Short bones of upper limb and associated joints"
