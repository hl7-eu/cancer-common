Logical: LastFollowUp
Id: LastFollowUp
Title: "LastFollowUp"
Description: "LastFollowUp logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet LastFollowUp)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Patient Reference"
* vitalStatus 1..1 CodeableConcept "VitalStatus"
* vitalStatus ^definition = "nan Choice: Alive | Dead"
* evidenceOfDisease 0..1 boolean "EvidenceOfDisease"
* evidenceOfDisease ^definition = "If VitalStatus is Alive, then this attribute must be present; otherwise, it must not be present. nan"
* causeOfDeath 0..1 CodeableConcept "CauseOfDeath"
* causeOfDeath ^definition = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present. nan"
* date 1..1 dateTime "Date"
* deathDate 0..1 dateTime "DeathDate"
* deathDate ^definition = "If VitalStatus is Dead, then this attribute must be present; otherwise, it must not be present. nan"
