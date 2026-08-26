Logical: LastFollowUp
Id: LastFollowUp
Title: "LastFollowUp"
Description: "Logical model representing the assessment of the patient’s status at a specific follow-up visit, including vital status and evidence of disease. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet LastFollowUp)."
Characteristics: #can-be-target

* obeys lfu-1
* obeys lfu-2
* obeys lfu-3
* obeys lfu-4
* subject 1..1 Reference(CancerPatient) "Patient Reference"
* subject ^definition = "Reference to the patient (subject) for whom follow-up information is recorded."
* VitalStatus 1..1 CodeableConcept "VitalStatus"
* VitalStatus ^definition = "Patient vital status at the time of follow-up (Alive or Dead)."
* VitalStatus ^comment = "Choice: Alive | Dead"
* EvidenceOfDisease 0..1 boolean "EvidenceOfDisease"
* EvidenceOfDisease ^definition = "If Alive, indicates whether there is evidence of disease at follow-up."
* EvidenceOfDisease ^comment = "If VitalStatus is Alive, then this attribute must be present; otherwise, it must not be present."
* causeOfDeath 0..1 CodeableConcept "CauseOfDeath"
* causeOfDeath ^definition = "If Dead, cause of death."
* causeOfDeath ^comment = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present."
* date 1..1 dateTime "Date"
* date ^definition = "Date of the follow-up assessment." 
* deathDate 0..1 dateTime "DeathDate"
* deathDate ^definition = "If Dead, the date of death."
* deathDate ^comment = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present."

Invariant: lfu-1
Description: "EvidenceOfDisease must be present if VitalStatus is Alive; otherwise, it must not be present."
Expression: "(VitalStatus.where(text = 'Alive').exists()) = EvidenceOfDisease.exists()"
Severity: #error
Invariant: lfu-2
Description: "CauseOfDeath must be present if VitalStatus is Dead; otherwise, it must not be present."
Expression: "(VitalStatus.where(text = 'Dead').exists()) = causeOfDeath.exists()"
Severity: #error
Invariant: lfu-3
Description: "DeathDate must be present if VitalStatus is Dead; otherwise, it must not be present."
Expression: "(VitalStatus.where(text = 'Dead').exists()) = deathDate.exists()"
Severity: #error
Invariant: lfu-4
Description: "DeathDate must not be present if VitalStatus is Alive."
Severity: #error
Expression: "VitalStatus.where(text = 'Alive').exists() implies deathDate.empty()"


