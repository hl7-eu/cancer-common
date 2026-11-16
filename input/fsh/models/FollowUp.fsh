Logical: FollowUp
Id: FollowUp
Title: "FollowUp"
Description: "Logical model representing the assessment of the patient’s status at a specific follow-up visit, including vital status and evidence of disease. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet LastFollowUp; renamed FollowUp per FHIR-58024)."
Characteristics: #can-be-target

* obeys fu-1
* obeys fu-2
* obeys fu-3
* obeys fu-4
* subject 1..1 CancerPatient "Patient Reference"
* subject ^definition = "Reference to the patient (subject) for whom follow-up information is recorded."
* vitalStatus 1..1 CodeableConcept "VitalStatus"
* vitalStatus ^definition = "Patient vital status at the time of follow-up (Alive or Dead)."
* vitalStatus ^comment = "Choice: Alive | Dead"
* evidenceOfDisease 0..1 boolean "EvidenceOfDisease"
* evidenceOfDisease ^definition = "If Alive, indicates whether there is evidence of disease at follow-up."
* evidenceOfDisease ^comment = "If VitalStatus is Alive, then this attribute must be present; otherwise, it must not be present."
* causeOfDeath 0..1 CodeableConcept "CauseOfDeath"
* causeOfDeath ^definition = "If Dead, cause of death."
* causeOfDeath ^comment = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present."
* date 1..1 dateTime "Date"
* date ^definition = "Date of the follow-up assessment." 
* deathDate 0..1 dateTime "DeathDate"
* deathDate ^definition = "If Dead, the date of death."
* deathDate ^comment = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present."

Invariant: fu-1
Description: "EvidenceOfDisease must be present if VitalStatus is Alive; otherwise, it must not be present."
Expression: "(vitalStatus.where(text = 'Alive').exists()) = evidenceOfDisease.exists()"
Severity: #error
Invariant: fu-2
Description: "CauseOfDeath must be present if VitalStatus is Dead; otherwise, it must not be present."
Expression: "(vitalStatus.where(text = 'Dead').exists()) = causeOfDeath.exists()"
Severity: #error
Invariant: fu-3
Description: "DeathDate must be present if VitalStatus is Dead; otherwise, it must not be present."
Expression: "(vitalStatus.where(text = 'Dead').exists()) = deathDate.exists()"
Severity: #error
Invariant: fu-4
Description: "DeathDate must not be present if VitalStatus is Alive."
Severity: #error
Expression: "vitalStatus.where(text = 'Alive').exists() implies deathDate.empty()"


