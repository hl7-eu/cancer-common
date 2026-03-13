Logical: LastFollowUp
Id: LastFollowUp
Title: "LastFollowUp"
Description: "LastFollowUp logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet LastFollowUp)."
Characteristics: #can-be-target

* obeys lfu-1
* obeys lfu-2
* obeys lfu-3
* subject 1..1 CancerPatient "Patient Reference"
* vitalStatus 1..1 CodeableConcept "VitalStatus"
* vitalStatus ^definition = "Choice: Alive | Dead"
* evidenceOfDisease 0..1 boolean "EvidenceOfDisease"
* evidenceOfDisease ^definition = "If VitalStatus is Alive, then this attribute must be present; otherwise, it must not be present."
* causeOfDeath 0..1 CodeableConcept "CauseOfDeath"
* causeOfDeath ^definition = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present."
* date 1..1 dateTime "Date"
* deathDate 0..1 dateTime "DeathDate"
* deathDate ^definition = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present."

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
