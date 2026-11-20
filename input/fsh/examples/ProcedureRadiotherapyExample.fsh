Instance: ProcedureRadiotherapy1-Example
InstanceOf: procedure-radiotherapy-eu-ccm
Usage: #example
Description: "Example of a postoperative (adjuvant) curative radiotherapy course to the lower lobe of the lung, 2018-09-10 to 2018-10-12."

* status = #completed

* code = $sct#1287742003 "Radiotherapy (procedure)"

* subject = Reference(Patient1-Example)

* reasonReference[condition] = Reference(ConditionAtDiagnosis1-Example)

* extension[intent].valueCodeableConcept = $sct#373808002 "Curative - procedure intent (qualifier value)"

* extension[setting].valueCodeableConcept = $sct#262061000 "Postoperative period (qualifier value)"

* performedPeriod.start = "2018-09-10"
* performedPeriod.end = "2018-10-12"

* bodySite = $icd03#C34.3 "Lower lobe, lung"
