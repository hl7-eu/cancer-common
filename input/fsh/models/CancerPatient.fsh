Logical: CancerPatient
Id: CancerPatient
Title: "Cancer Patient"
Description: """
Logical model describing the patient affected by cancer, acting as the central subject for diagnosis, treatments, disease evolution and follow-up. Derived from Cancer_Common_Logical_Model_20261123.xlsx (sheet CancerPatient).

For guidance on how this logical model maps to HL7 FHIR and OMOP, refer to the [FHIR Model Map](fhirmap-cancerpatient.html)
and [OMOP Model Map](omopmap-cancerpatient.html) pages.
"""
Characteristics: #can-be-target

* birthDate 1..1 dateTime "BirthDate"
* birthDate ^definition = "Patient date of birth (at least the year should be available)."
* birthDate ^comment = "At least the year must be present."
* sexAtBirth 1..1 CodeableConcept "SexAtBirth"
* sexAtBirth ^definition = "Biological sex assigned at birth, determined by sex characteristics observed at birth or infancy (e.g., genital characteristics and/or chromosome composition). This represents sex as a biological variable and should not be used to represent gender identity or administrative gender."
* sexAtBirth ^comment = "This element refers to biological sex assigned at birth (not gender identity). It is typically captured once and is not expected to change. Choice: Male | Female | Unknown | Other"
* observedSexGender 0..1 CodeableConcept "ObservedSex Gender"
* observedSexGender ^definition = "Recorded sex at the time of cancer diagnosis, if different from SexAtBirth. This captures what is documented at diagnosis and should be interpreted in line with the clinical record context."
* observedSexGender ^comment = "It shall be present if changed respect the SexAtBirth. See https://confluence.hl7.org/spaces/VOC/pages/40743893/The+Gender+Harmony+Project"
* comorbiditiesAtCancerDiagnosis 0..* CodeableConcept "ComorbiditiesAtCancerDiagnosis"
* comorbiditiesAtCancerDiagnosis ^definition = "Active chronic conditions present at the time of cancer diagnosis."
* comorbiditiesAtCancerDiagnosis ^comment = "Active chronic conditions present at the time of cancer diagnosis."

