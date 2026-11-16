//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationTreatmentResponseEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-treatment-response-eu-ccm
Title: "Observation Treatment Response (CCM)"
Description: """This informative profile constrains the Observation resource to represent the Overall Cancer Treatment Response for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code = $loinc#88040-1 "Response to cancer treatment"

* focus ^slicing.discriminator.type = #type
* focus ^slicing.discriminator.path = "resolve()"
* focus ^slicing.rules = #open
* focus ^slicing.description = "Sliced by resolved resource type"

* focus contains
    condition 1..1 and
    progression 0..1

* focus[condition] only Reference(CancerConditionAtDiagnosisEuCcm)
* focus[progression] only Reference(ObservationClinicalCancerProgression)


* valueCodeableConcept 1..1
* valueCodeableConcept from TreatmentResponseTypeVS (required)

* effectiveDateTime 1..1
* effectiveDateTime ^definition = "Date of the response assessment."

// ValueSet needs improvement! Not final!
ValueSet: TreatmentResponseTypeVS
Id: treatment-response-type-vs
Title: "Treatment Response Type VS"
Description: "This Value Set describes the overall treatment response type of the overall cancer treatment."
* ^status = #draft
* ^experimental = false
* $sct#103338009 "In full remission (qualifier value)"
* $sct#103337004 "In partial remission (qualifier value)"
* $sct#419835002 "Tumor progression (finding)"
* $sct#359748005 "Patient condition unchanged (finding)" 