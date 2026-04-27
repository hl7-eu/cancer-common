Instance: CancerStageClinical-Example
InstanceOf: CancerStage
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis-Example)
* classificationType.coding[0].code = #TNM
* classificationType.coding[0].display = "Tumor Linphonode Metastasis"
* value[+].id = "T2"
* value[+].id = "N0"
* value[+].id = "M0"
* type.coding[0].code = #Clinical
* type.coding[0].display = "Clinical"
* imagingReference = Reference(Imaging-Example)