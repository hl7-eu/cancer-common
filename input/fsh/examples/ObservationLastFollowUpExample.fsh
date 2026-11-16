Instance: ObservationFollowUp1-Example
InstanceOf: observation-last-follow-up-eu-ccm
Usage: #example
Description: "Example of an observation stating the last follow up of the patient."

* status = #final
* code = $sct#413744002 "Cancer screening follow up (finding)"


* subject = Reference(Patient1-Example)

* extension[VitalStatus].valueCodeableConcept = $sct#438949009 "Alive (finding)"

* effectiveDateTime = "2018-10-30"

* extension[EvidenceOfDisease].valueBoolean = true


Instance: ObservationFollowUp2-Example
InstanceOf: observation-last-follow-up-eu-ccm
Usage: #example
Description: "Example comorbidity observation documenting the Charlson Comorbidity Index and associated comorbid conditions."

* status = #final
* code = $sct#413744002 "Cancer screening follow up (finding)"


* subject = Reference(Patient1-Example)

* extension[VitalStatus].valueCodeableConcept = $sct#419099009 "Dead (finding)"

* effectiveDateTime = "2020-11-12"

* extension[DeathInfo].extension[cause].valueCodeableConcept = $sct#90049009 "Unexplained sudden death (event)"

* extension[DeathInfo].extension[date].valueDateTime = "2020-11-05"