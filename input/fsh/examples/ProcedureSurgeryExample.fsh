Instance: ProcedureSurgery1-Example
InstanceOf: procedure-surgery-eu-ccm
Usage: #example
Description: "Example of a surgery effecting the lung."

* status = #completed

* subject = Reference(Patient1-Example)

* reasonReference[condition] = Reference(ConditionAtDiagnosis1-Example)

* performedDateTime = "2018-06-12"

* extension[SurgeryIntent].valueCodeableConcept = $sct#373808002 "Curative - procedure intent (qualifier value)"

* bodySite = $icd03#C34.3 "Lower lobe, lung"


