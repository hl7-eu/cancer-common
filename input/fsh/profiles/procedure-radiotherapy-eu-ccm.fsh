//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ProcedureRadiotherapyEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Procedure
Id: procedure-radiotherapy-eu-ccm
Title: "Procedure Radiotherapy (CCM)"
Description: """This informative profile constrains the Procedure resource to represent a radiotherapy course delivered to the patient for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
The profile summarises the whole radiotherapy course (comparable to the mCODE Radiotherapy Course Summary); individual fractions or treatment phases are out of scope of the ECCDM.
"""

* insert SetFmmandStatusRule ( 0, informative )

* obeys ccm-rt-1

* status ^short = "in-progress while the radiotherapy is ongoing, completed once finished."

* code 1..1
* code = $sct#1287742003 "Radiotherapy (procedure)"

* subject only Reference(PatientEuCcm)
* subject 1..1
* subject ^definition = "The cancer patient receiving the radiotherapy."

* reasonReference ^slicing.discriminator.type = #type
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference ^slicing.description = "Sliced by resolved resource type"

* reasonReference contains
    condition 1..1 and
    progression 0..1

* reasonReference[condition] only Reference(CancerConditionAtDiagnosisEuCcm)
* reasonReference[condition] ^definition = "The cancer condition at diagnosis targeted by the radiotherapy."
* reasonReference[progression] only Reference(ObservationClinicalCancerProgression)
* reasonReference[progression] ^definition = "The clinical progression event, if the radiotherapy is delivered in response to a progression."

* extension contains CancerTreatmentIntent named intent 1..1
* extension contains CancerTreatmentSetting named setting 0..1

* performed[x] only Period
* performed[x] 1..1
* performedPeriod.start 1..1
* performedPeriod.start ^definition = "Start date of the radiotherapy course."
* performedPeriod.end 0..1
* performedPeriod.end ^definition = "End date of the radiotherapy course. It might not be available while the radiotherapy is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death."

* bodySite 1..*
* bodySite ^definition = "Anatomical site(s) targeted by the radiotherapy."

Invariant: ccm-rt-1
Description: "While the radiotherapy is ongoing (status in-progress) no end date shall be present."
Severity: #error
Expression: "status = 'in-progress' implies performed.ofType(Period).end.empty()"
