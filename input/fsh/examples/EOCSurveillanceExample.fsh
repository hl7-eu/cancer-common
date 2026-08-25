Instance: EOCActiveSurveillance1-Example
InstanceOf: episode-of-care-surveillance-eu-ccm
Usage: #example
Description: "Example describes the episode of an active surveillance of the patient. The surveillance episode is still active."

* status = #active

* patient = Reference(Patient1-Example)

* diagnosis.condition = Reference(ConditionAtDiagnosis1-Example)

* period.start = "2018-09-10"









