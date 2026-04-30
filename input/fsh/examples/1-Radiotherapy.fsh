Instance: Radiotherapy-Example
InstanceOf: Radiotherapy
Usage: #example

* subject = CancerPatient-Example
* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis-Example)
* intent.coding[0].code = #Definitive
* intent.coding[0].display = "Definitive"
* startDate = "2018-09-10"
* endDate = "2018-10-12"
* bodySite.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* bodySite.coding[0].version = "3"
* bodySite.coding[0].code = #C34.3
* bodySite.coding[0].display = "Lower lobe, lung"
* setting.coding[0].code = #Postoperative/Adjuvant
* setting.coding[0].display = "Postoperative/Adjuvant"