//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: EOCRadiotherapy
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: EpisodeOfCare
Id: episode-of-care-radiotherapy-eu-ccm
Title: "Episode of Care Radiotherapy (CCM)"
Description: """This informative profile constrains the EpisodeOfCare resource to represent the Radiotherapy treatment done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""


* insert SetFmmandStatusRule ( 0, informative )

* patient only Reference(PatientEuCcm)
* patient ^definition = "Here the cancer patient must be referenced."

* diagnosis 1..1
* diagnosis.condition only Reference(CancerConditionAtDiagnosisEuCcm)
* diagnosis ^definition = "Here the cancer diagnosis must be referenced"

* extension contains CancerProgressionReferenceRT named CancerProgressionReferenceRT 0..1

* extension contains RadiotherapyIntent named RadiotherapyIntent 1..1

* extension contains RadiotherapyBodySite named RadiotherapyBodySite 1..*

* extension contains RadiotherapySetting named RadiotherapySetting 0..1

* period 1..1
* period.start 1..1
* period.start ^definition = "This element notes the start date of the radiotherpay"
* period.end 0..1
* period.end  ^definition = "This element notes the end of the radiotherapy. It might not be available while the radiotherapy is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death."

Extension: CancerProgressionReferenceRT
Id: cancer-progression-reference-rt
Title: "Cancer Progression Reference Radiotherapy"
Description: "A reference for stating the cancer progression"
Context: EpisodeOfCare
* value[x] only Reference(ObservationClinicalCancerProgression)


Extension: RadiotherapyIntent
Id: radiotherapy-intent
Title: "Radioterhapy Intent"
Description: "Indicates which intent the radiotherapy had."
Context: EpisodeOfCare
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from RadiotherapyIntentVS (required)

// Is this the same valueset as in surgery? If yes, than one value set for both
ValueSet: RadiotherapyIntentVS
Id: radiotherapy-intent-vs
Title: "Intent of Radiotherapy"
Description: "Determinse the intent of the radiotherapy."
* ^status = #draft
* ^experimental = false
* $sct#363676003 "Palliative - procedure intent (qualifier value)"
* $sct#373808002 "Curative - procedure intent (qualifier value)"

Extension: RadiotherapyBodySite
Id: radiotherapy-body-site
Title: "Radioterhapy Site"
Description: "Anatomical site(s) targeted by radiotherapy."
Context: EpisodeOfCare
* value[x] only CodeableConcept
* value[x] 1..1

Extension: RadiotherapySetting

Id: radiotherapy-setting
Title: "Radioterhapy Setting"
Description: "Strategic timing/setting of radiotherapy (e.g. neoadjuvant, adjuvant, concomitant, alone)."
Context: EpisodeOfCare
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from RadiotherapySettingVS (required)

// Check Value set, alone is unclear..
ValueSet: RadiotherapySettingVS
Id: radiotherapy-setting-vs
Title: "Value Set for strategic timing/setting of radiotherapy"
Description: "Determinse the setting of the radiotherapy."
* ^status = #draft
* ^experimental = false
* $sct#79970003 "Simultaneous (qualifier value)"
* $sct#262061000 "Postoperative period (qualifier value)"
* $sct#262068006 "Preoperative (qualifier value)"
* $sct#229803000 "Single episode (qualifier value)"
