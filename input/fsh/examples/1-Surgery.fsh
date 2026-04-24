Instance: Surgery-Example
InstanceOf: Surgery
Usage: #example

* subject = CancerPatient-Example
* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis-Example)
* intent.coding[0].code = #Definitive
* intent.coding[0].display = "Definitive"
* date = "2018-06-12"
* bodySite.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* bodySite.coding[0].version = "3"
* bodySite.coding[0].code = #C34.3
* bodySite.coding[0].display = "Lower lobe, lung"