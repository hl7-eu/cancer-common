Instance: ObservationFollowUp1-Example
InstanceOf: observation-last-follow-up-eu-ccm
Usage: #example
Description: "Example comorbidity observation documenting the Charlson Comorbidity Index and associated comorbid conditions."

* status = #final
* code = $sct#413744002 "Cancer screening follow up (finding)"


* subject = Reference(Patient1-Example)

* extension[vitalstatus].valueCodeableConcept = $sct#438949009 "Alive (finding)"

* effectiveDateTime = "2018-10-30"

* extension[evidenceofdisease].valueBoolean = true


Instance: ObservationFollowUp2-Example
InstanceOf: observation-last-follow-up-eu-ccm
Usage: #example
Description: "Example comorbidity observation documenting the Charlson Comorbidity Index and associated comorbid conditions."

* status = #final
* code = $sct#413744002 "Cancer screening follow up (finding)"


* subject = Reference(Patient1-Example)

* extension[vitalstatus].valueCodeableConcept = $sct#419099009 "Dead (finding)"

* effectiveDateTime = "2020-11-12"

* extension[deathinfo].extension[cause].valueCodeableConcept = $sct#90049009 "Unexplained sudden death (event)"

* extension[deathinfo].extension[date].valueDateTime = "2020-11-05"