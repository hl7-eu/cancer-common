Instance: ComorbidityObservation1-Example
InstanceOf: observation-comorbidity-eu-ccm
Usage: #example
Description: "Example comorbidity observation documenting the Charlson Comorbidity Index and associated comorbid conditions."

* status = #final
* subject = Reference(Patient1-Example)
* code = $loinc#75618-9 "Comorbid condition"
* method.text = "Charlson Comorbidity Index"
* valueInteger = 4
* extension[comorbidConditionPresent].valueCodeableConcept = $sct#44054006 "Diabetes mellitus type 2"
* extension[comorbidConditionPresent][+].valueCodeableConcept = $sct#38341003 "Hypertensive disorder, systemic arterial"
* note.text = "Charlson Comorbidity Index calculated at diagnosis."
* effectiveDateTime = "2026-06-11"

* performer = Reference(Practitioner1-Example)

Instance: Patient1-Example
InstanceOf: patient-eu-ccm
Usage: #example
Description: "Example patient used in Cancer Common implementation guide examples."

* identifier.system = "http://example.org/patient-id"
* identifier.value = "P001"

* name.family = "Doe"
* name.given = "John"

* gender = #male

* birthDate = "1965-04-12"

Instance: Practitioner1-Example
InstanceOf: Practitioner
Usage: #example
Description: "Example practitioner acting as performer of clinical observations."

* identifier.system = "http://example.org/practitioner-id"
* identifier.value = "PR001"

* name.family = "Smith"
* name.given = "Jane"