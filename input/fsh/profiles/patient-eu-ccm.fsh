
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PatientEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent:   PatientEu
Id:       patient-eu-ccm
Title:    "Patient (CCM)"
Description: "This profile defines how to represent Patient in FHIR for the purpose of the IDEA4RC project."

//-------------------------------------------------------------------------------------------
* . ^short = "Information about an individual receiving health care services"
* . ^definition = "Information about an individual receiving health care services"

* obeys recordedSexOrGender-or-gender

* extension contains 
   $recordedSexOrGender named recordedSexOrGender 0..*

* extension[recordedSexOrGender] 

* extension[recordedSexOrGender].extension[value] ^example.label = "sex-assigned-at-birth"
* extension[recordedSexOrGender].extension[value].valueCodeableConcept ^example.valueCodeableConcept = $administrative-gender#female

* extension[recordedSexOrGender].extension[type] 1..
* extension[recordedSexOrGender].extension[type] ^example.label = "sex-assigned-at-birth"
* extension[recordedSexOrGender].extension[type].valueCodeableConcept ^example.valueCodeableConcept = $loinc#76689-9 "Sex assigned at birth" 



* gender 0..
  * ^short = "Administrative gender"
  * ^comment = """The gender element is intended to be administrative gender. Usually, requested for administrative purposes in primary use. 
  It can be used when no other information is available. For clinical purposes, use as possible the extensions"""


* birthDate 1..

Invariant: recordedSexOrGender-or-gender
Description: "If recordedSexOrGender extension is not present, gender shall be valued."
Expression: "extension.where(url = 'http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender').exists() or gender.exists()"
Severity: #error

