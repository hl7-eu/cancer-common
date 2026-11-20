Instance: Patient1-Example
InstanceOf: patient-eu-ccm
Title: "Patient Example"
Usage: #example
Description: "Example patient used by all profile examples of this guide. FHIR rendering of the logical model instance CancerPatient1-Example (born 1975, sex at birth female): birthDate carries the year, the recordedSexOrGender extension carries sexAtBirth."

* identifier.system = "http://example.org/patient-id"
* identifier.value = "P001"

* name.family = "Doe"
* name.given = "Anna"

// CancerPatient.sexAtBirth = Female
* extension[recordedSexOrGender].extension[value].valueCodeableConcept = $administrative-gender#female "Female"
* extension[recordedSexOrGender].extension[type].valueCodeableConcept = $loinc#76689-9 "Sex assigned at birth"

// Administrative gender, same as sex at birth in this scenario (no observedSexGender in the logical model instance)
* gender = #female

// CancerPatient.birthDate = 1975 (at least the year must be present)
* birthDate = "1975"
