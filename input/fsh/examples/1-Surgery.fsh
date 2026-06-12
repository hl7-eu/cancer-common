Instance: Surgery1-Example
Title: "Surgery Example"
Description: "Example definitive surgery for the lower lobe lung cancer condition."
InstanceOf: Surgery
Usage: #example

* subject = Reference(CancerPatient1-Example)
* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* intent.coding[0].code = #Definitive
* intent.coding[0].display = "Definitive"
* date = "2018-06-12"
* bodySite.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* bodySite.coding[0].code = #C34.3
* bodySite.coding[0].display = "Lower lobe, lung"
