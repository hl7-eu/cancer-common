Instance: CancerStagePathological-Example
InstanceOf: CancerStage
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis-Example)
* classificationType.coding[0].code = #TNM
* classificationType.coding[0].display = "Tumor Linphonode Metastasis"
* value[+].id = "T2"
* value[+].id = "N1"
* value[+].id = "M0"
* type.coding[0].code = #Pathological
* type.coding[0].display = "Pathological"
* surgeryReference = Reference(Surgery-Example)