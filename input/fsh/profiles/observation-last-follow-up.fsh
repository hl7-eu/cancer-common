//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationLastFollowUp
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-last-follow-up-eu-ccm
Title: "Observation: Last Follow Up"
Description: """This informative profile constrains the Observation resource to represent the last follow up done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code = $sct#413744002 "Cancer screening follow up (finding)" // LOINC no suitable code found

* subject only Reference(PatientEuCcm)
* subject 1..
* subject ^definition = "The patient for whom the follow up was done."


* extension contains VitalStatus named vitalstatus 1..1

* extension contains EvidenceOfDisease named evidenceofdisease 0..1

* extension contains DeathInfo named deathinfo 0..1

* obeys vitalstatus-death-evidence-1

* effectiveDateTime 1..1
* effectiveDateTime ^short = "Date of the follow-up assessment"


Extension: EvidenceOfDisease
Id: evidence-of-disease
Title: "Evidence of Disease"
Description: "Indicates whether the patient has an evidence of a disease when the vital status is alive."
Context: Observation
* value[x] only boolean
* value[x] 1..1

Extension: DeathInfo
Id: death-info
Title: "Death Information"
Description: "Gives information about how and when the patient died."
Context: Observation
* extension contains
    cause 1..1 and
    date 1..1

* extension[cause].value[x] only CodeableConcept
* extension[cause].value[x] 1..1
* extension[cause] ^short = "Cause of Death coded"

* extension[date].value[x] only dateTime
* extension[date].value[x] 1..1
* extension[date] ^short = "Date of Death"



Extension: VitalStatus
Id: vital-status
Title: "Vital Status"
Description: "Indicates whether the patient is alive or deade at the date of the scheduled follow-up."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from DeadOrAliveVS (required)


ValueSet: DeadOrAliveVS
Id: dead-or-alive-vs
Title: "Dead or Alive"
Description: "Whether the patient was dead or alive at the date of the scheduled follow-up"
* ^status = #draft
* ^experimental = false
* $sct#438949009 "Alive (finding)"
* $sct#419099009 "Dead (finding)"

Invariant: vitalstatus-death-evidence-1
Description: "If vitalStatus is 'alive', evidenceOfDisease must be present. If vitalStatus is 'dead', deathInfo must be present."
Severity: #error
Expression: "(extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/vital-status').value.coding.code = '438949009' implies extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/evidence-of-disease').exists()) and (extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/vital-status').value.coding.code = '419099009' implies extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/death-info').exists())"
