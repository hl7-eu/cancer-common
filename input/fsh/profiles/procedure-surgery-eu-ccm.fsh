//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ProcedureSurgery
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Procedure
Id: procedure-surgery-eu-ccm
Title: "Procedure Surgery (CCM)"
Description: """This informative profile constrains the Procedure resource to represent the Surgery done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""


* insert SetFmmandStatusRule ( 0, informative )


* subject only Reference(PatientEuCcm)
* subject 1..1
* subject ^definition = "The patient on which the imaging was done."

* reasonReference ^slicing.discriminator.type = #type
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference ^slicing.description = "Sliced by resolved resource type"

* reasonReference contains
    condition 1..1 and
    progression 0..1

* reasonReference[condition] only Reference(CancerConditionAtDiagnosisEuCcm)
* reasonReference[progression] only Reference(ObservationClinicalCancerProgression)

* performedDateTime 1..1
* performedDateTime ^short = "Date when the surgery was performed."

* extension contains SurgeryIntent named SurgeryIntent 1..1

* bodySite 1..*





Extension: SurgeryIntent
Id: surgery-intent
Title: "Intent of the Surgery"
Description: "Defines weather the intent of the surgery was 'definitive' or 'palliative'."
Context: Procedure
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from SurgeryIntentVS (required)

// check Value Set! Is curative = definitive?, snomed procedure intent does not list definitive as a possible intent option
ValueSet: SurgeryIntentVS
Id: surgery-intent-vs
Title: "Surgery Intent"
Description: "Describes weather the intent of the surgery was 'definitive' or 'palliative'."
* ^status = #draft
* ^experimental = false
* $sct#363676003 "Palliative - procedure intent (qualifier value)"
* $sct#373808002 "Curative - procedure intent (qualifier value)"

