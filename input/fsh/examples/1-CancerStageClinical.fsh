Instance: CancerStageClinical1-Example
Title: "Clinical Cancer Stage Example"
Description: "Example clinical TNM stage for the cancer condition at diagnosis."
InstanceOf: CancerStage
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* classificationType.text = "TNM"
// Stage value 1
* stage[+].code.text = "T category"
* stage[=].value.text = "T2"
// Stage value 2
* stage[+].code.text = "N category"
* stage[=].value.text = "N0"
// Stage value 3
* stage[+].code.text = "M category"
* stage[=].value.text = "M0"
* type.coding[0].code = #Clinical
* type.coding[0].display = "Clinical"
* type.text = "Clinical"

* evidenceReference[+] = Reference(Imaging1-Example)
