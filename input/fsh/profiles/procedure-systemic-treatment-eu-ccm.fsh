//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ProcedureSystemicTreatmentEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Procedure
Id: procedure-systemic-treatment-eu-ccm
Title: "Procedure Systemic Treatment (CCM)"
Description: """This informative profile constrains the Procedure resource to represent a systemic anti-cancer treatment course (chemotherapy, immunotherapy, targeted therapy, hormonal therapy) delivered to the patient for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
The profile summarises the whole treatment course. In primary systems the course is typically derived from the individual MedicationRequest / MedicationAdministration resources of the regimen, which are out of scope of the ECCDM.
"""

* insert SetFmmandStatusRule ( 0, informative )

* obeys ccm-st-1

* status ^short = "in-progress while the treatment is ongoing, completed once finished."

* code 1..1
* code from SystemicTreatmentTypeVS (extensible)
* code ^definition = "Category of systemic treatment (e.g. chemotherapy, immunotherapy, targeted therapy, hormonal therapy)."

* subject only Reference(PatientEuCcm)
* subject 1..1
* subject ^definition = "The cancer patient receiving the systemic treatment."

* reasonReference ^slicing.discriminator.type = #type
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference ^slicing.description = "Sliced by resolved resource type"

* reasonReference contains
    condition 1..1 and
    progression 0..1

* reasonReference[condition] only Reference(CancerConditionAtDiagnosisEuCcm)
* reasonReference[condition] ^definition = "The cancer condition at diagnosis targeted by the systemic treatment."
* reasonReference[progression] only Reference(ObservationClinicalCancerProgression)
* reasonReference[progression] ^definition = "The clinical progression event, if the treatment is delivered in response to a progression."

* extension contains CancerTreatmentIntent named intent 1..1
* extension contains CancerTreatmentSetting named setting 0..1

* performed[x] only Period
* performed[x] 1..1
* performedPeriod.start 1..1
* performedPeriod.start ^definition = "Start date of the systemic treatment course."
* performedPeriod.end 0..1
* performedPeriod.end ^definition = "End date of the systemic treatment course. It might not be available while the treatment is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death."

Invariant: ccm-st-1
Description: "While the treatment is ongoing (status in-progress) no end date shall be present; this expresses the 'ongoing' flag of the logical model."
Severity: #error
Expression: "status = 'in-progress' implies performed.ofType(Period).end.empty()"

// Targeted therapy: SNOMED CT code to be confirmed (not yet included).
ValueSet: SystemicTreatmentTypeVS
Id: systemic-treatment-type-vs
Title: "Systemic Treatment Type"
Description: "Category of systemic anti-cancer treatment: chemotherapy, immunotherapy, hormonal therapy (targeted therapy to be added)."
* ^status = #draft
* ^experimental = false
* $sct#367336001 "Chemotherapy (procedure)"
* $sct#76334006 "Immunotherapy (procedure)"
* $sct#169413002 "Hormone therapy (procedure)"
