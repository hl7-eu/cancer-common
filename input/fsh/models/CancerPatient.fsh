Logical: CancerPatient
Id: CancerPatient
Title: "Cancer Patient"
Description: "Cancer patient logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet Patient)."
Characteristics: #can-be-target

* birthDate 1..1 dateTime "BirthDate"
* birthDate ^definition = "At least the year must be present nan"
* sexAtBirth 1..1 CodeableConcept "SexAtBirth"
* sexAtBirth ^definition = "nan Choice: Male | Female | Unknown | Other"
* observedSexGender 0..1 CodeableConcept "ObservedSex Gender"
* observedSexGender ^definition = "See https://confluence.hl7.org/spaces/VOC/pages/40743893/The+Gender+Harmony+Project nan"
* comorbiditiesAtCancerDiagnosis 0..* CodeableConcept "ComorbiditiesAtCancerDiagnosis"
* comorbiditiesAtCancerDiagnosis ^definition = "Active chronic conditions present at the time of cancer diagnosis nan"
