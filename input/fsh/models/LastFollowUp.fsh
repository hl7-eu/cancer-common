Logical: LastFollowUp
Id: LastFollowUp
Title: "LastFollowUp"
Description: "LastFollowUp logical model from Cancer_Common_Logical_Model_20260408.xlsx (sheet LastFollowUp)."
Characteristics: #can-be-target

* obeys lfu-1
* obeys lfu-2
* obeys lfu-3
* subject 1..1 CancerPatient "Patient Reference"
* subject ^definition "Reference to the patient (subject) for whom follow-up information is recorded."
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

Invariant: lfu-1
Description: "EvidenceOfDisease must be present if VitalStatus is Alive; otherwise, it must not be present."
Expression: "(vitalStatus.coding.where(code = 'Alive').exists()) = evidenceOfDisease.exists()"
Severity: #error

Invariant: lfu-2
Description: "CauseOfDeath must be present if VitalStatus is Dead; otherwise, it must not be present."
Expression: "(vitalStatus.coding.where(code = 'Dead').exists()) = causeOfDeath.exists()"
Severity: #error

Invariant: lfu-3
Description: "DeathDate must be present if VitalStatus is Dead; otherwise, it must not be present."
Expression: "(vitalStatus.coding.where(code = 'Dead').exists()) = deathDate.exists()"
Severity: #error
