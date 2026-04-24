Instance: CancerConditionAtDiagnosis-Example
InstanceOf: CancerConditionAtDiagnosis
Usage: #example

* subject = CancerPatient-Example

* histologyBehaviour.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* histologyBehaviour.coding[0].version = "3"
* histologyBehaviour.coding[0].code = #8140/3
* histologyBehaviour.coding[0].display = "Adenocarcinoma, NOS"

* bodySite.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* bodySite.coding[0].version = "3"
* bodySite.coding[0].code = #C34.3
* bodySite.coding[0].display = "Lower lobe, lung"

* tumourGradeSystem.text = "Standard Histological Grading System"

* tumourGradeValue = "G3"

* visitDate = "2024-01-15T10:00:00+01:00"