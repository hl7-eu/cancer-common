Instance: ProcedureSystemicTreatment1-Example
InstanceOf: procedure-systemic-treatment-eu-ccm
Usage: #example
Description: "Example of a palliative chemotherapy course given after the loco-regional recurrence, 2019-09-10 to 2019-12-16."

* status = #completed

* code = $sct#367336001 "Chemotherapy (procedure)"

* subject = Reference(Patient1-Example)

* reasonReference[condition] = Reference(ConditionAtDiagnosis1-Example)
* reasonReference[progression] = Reference(ObservationClinicalCancerProgression1-Example)

* extension[intent].valueCodeableConcept = $sct#363676003 "Palliative - procedure intent (qualifier value)"

* extension[setting].valueCodeableConcept = $sct#229803000 "Single episode (qualifier value)"

* performedPeriod.start = "2019-09-10"
* performedPeriod.end = "2019-12-16"
