//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: EOCRadiotherapy
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: EpisodeOfCare
Id: episode-of-care-radiotherapy-eu-ccm
Title: "Episode of Care: Active Surveillance"
Description: """This informative profile constrains the EpisodeOfCare resource to represent the radiotherapy treatment done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""


* insert SetFmmandStatusRule ( 0, informative )

* patient only Reference(PatientEuCcm)

* diagnosis 1..1
* diagnosis.condition only Reference(CancerConditionAtDiagnosisEuCcm)


* extension contains CancerProgressionReference named cancerprogressionreference 0..1

* extension contains RadiotherapyIntent named radiotherapyintent 1..1

* extension contains RadiotherapyodySite named radiotherapybodysite 1..*

* extension contains RadiotherapySetting named radiotherapysetting 0..1

* period 1..1
* period.start 1..1



Extension: CancerProgressionReference
Id: cancer-progression-reference
Title: "Cancer Progression Reference"
Description: "A reference for stating the cancer progression"
Context: Observation
* value[x] only Reference(ObservationCancerProgression)


Extension: RadiotherapyIntent
Id: radiotherapy-intent
Title: "Radioterhapy Intent"
Description: "Indicates which intent the radiotherapy had."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from RadiotherapyIntentVS (required)

// Is this the same valueset as in surgery? If yes, than one value set for both
ValueSet: RadiotherapyIntentVS
Id: radiotherapy-intent-vs
Title: "Intent of Radiotherapy"
Description: "Determinse the intent of the radiotherapy."
* $sct#363676003 "Palliative - procedure intent (qualifier value)"
* $sct#373808002 "Curative - procedure intent (qualifier value)"

Extension: RadiotherapyodySite
Id: radiotherapy-site
Title: "Radioterhapy Site"
Description: "Anatomical site(s) targeted by radiotherapy."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1

Extension: RadiotherapyodySetting
Id: radiotherapy-setting
Title: "Radioterhapy Intent"
Description: "Strategic timing/setting of radiotherapy (e.g. neoadjuvant, adjuvant, concomitant, alone)."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from RadiotherapyodySettingVS (required)

ValueSet: RadiotherapyodySettingVS
Id: radiotherapy-setting-vs
Title: "Value Set for strategic timing/setting of radiotherapy"
Description: "Determinse the intent of the radiotherapy."
* $sct#363676003 "Palliative - procedure intent (qualifier value)"
* $sct#373808002 "Curative - procedure intent (qualifier value)"
