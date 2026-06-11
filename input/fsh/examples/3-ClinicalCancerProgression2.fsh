Instance: ClinicalCancerProgression2-Example
Title: "Clinical Cancer Progression 2 Example"
Description: "Example clinical cancer progression showing complete remission on 2019-02-28."
InstanceOf: ClinicalCancerProgression
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* diseaseStatus.text = "Complete Remission"
* assertedDate = "2019-02-28"
