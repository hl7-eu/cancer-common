Instance: EOCRadiotherpay1-Example
InstanceOf: episode-of-care-radiotherapy-eu-ccm
Usage: #example
Description: "Example describes the Radiotherapy Care a patient has gotten in a specific time."

* status = #finished

* patient = Reference(Patient1-Example)

* diagnosis.condition = Reference(ConditionAtDiagnosis1-Example)

* extension[RadiotherapyIntent].valueCodeableConcept = $sct#373808002 "Curative - procedure intent (qualifier value)"

* extension[RadiotherapyBodySite].valueCodeableConcept = $icd03##C34.3 "Lower lobe, lung"

* extension[RadiotherapySetting].valueCodeableConcept = $sct#262061000 "Postoperative period (qualifier value)"

* period.start = "2018-09-10"

* period.end = "2018-10-12"








