Instance: ObservationTreatmentResponse1-Example
InstanceOf: observation-treatment-response-eu-ccm
Usage: #example
Description: "Example of an observation reporting the overall treatment response."

* status = #final
* code = $loinc#88040-1 "Response to cancer treatment"


* focus[condition] = Reference(ConditionAtDiagnosis1-Example)

* valueCodeableConcept = $sct#103338009 "In full remission (qualifier value)"

* effectiveDateTime = "2018-10-30"



