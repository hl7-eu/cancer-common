Instance: CancerStagePathological1-Example
Title: "Pathological Cancer Stage Example"
Description: "Example pathological TNM stage supported by the surgery example."
InstanceOf: CancerStage
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* classificationType.text = "TNM"
// Stage value 1
* stage[+].code.text = "T category"
* stage[=].value.text = "T2"
// Stage value 2
* stage[+].code.text = "N category"
* stage[=].value.text = "N1"
// Stage value 3
* stage[+].code.text = "M category"
* stage[=].value.text = "M0"
* type.coding[0].code = #Pathological
* type.coding[0].display = "Pathological"
* type.text = "Pathological"

* evidenceReference[+] = Reference(Surgery1-Example)
