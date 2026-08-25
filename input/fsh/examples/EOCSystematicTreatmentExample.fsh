Instance: EOCSystemartictreatment1-Example
InstanceOf: episode-of-care-systematic-treatment-eu-ccm
Usage: #example
Description: "Example describes the episode of a Systematic Treatment the patient has recieved."

* status = #finished 

* patient = Reference(Patient1-Example)

* diagnosis.condition = Reference(ConditionAtDiagnosis1-Example)

* extension[systematictreatmentintent].valueCodeableConcept = $sct#363676003 "Palliative - procedure intent (qualifier value)"

* type = $sct#367336001 "Chemotherapy (procedure)"

* period.start = "2019-09-10"

* period.end = "2019-12-16"

* extension[systematictreatmenongoing].valueBoolean = false

* extension[systematictreatmentsetting].valueCodeableConcept = $sct#229803000 "Single episode (qualifier value)"

