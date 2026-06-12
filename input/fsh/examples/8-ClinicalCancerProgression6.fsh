Instance: ClinicalCancerProgression6-Example
Title: "Clinical Cancer Progression 6 Example"
Description: "Example clinical cancer progression documenting metastatic progression on 2020-04-15."
InstanceOf: ClinicalCancerProgression
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* diseaseStatus.text = "Progression"
* assertedDate = "2020-04-15"
* extentType.text = "Metastatic"
* metastaticSites.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* metastaticSites.coding[0].code = #C40.1
* metastaticSites.coding[0].display = "Short bones of upper limb and associated joints"
