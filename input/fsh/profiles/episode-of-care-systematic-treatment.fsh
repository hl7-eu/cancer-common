//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: EOCSystematicTreatment
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: EpisodeOfCare
Id: episode-of-care-systematic-treatment-eu-ccm
Title: "Episode of Care: Systematic Treatment"
Description: """This informative profile constrains the EpisodeOfCare resource to represent the Systematic treatment done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""


* insert SetFmmandStatusRule ( 0, informative )

* patient only Reference(PatientEuCcm)

* diagnosis 1..1
* diagnosis.condition only Reference(CancerConditionAtDiagnosisEuCcm)


* extension contains CancerProgressionReferenceST named cancerprogressionreferencest 0..1

* extension contains SystematicTreatmentIntent named systematictreatmentintent 1..1

* type 1..1
* type ^definition = "Category of systemic treatment (e.g. chemotherapy, immunotherapy, targeted therapy, hormonal therapy)."

* period 1..1
* period.start 1..1

* extension contains SystematicTreatmentOngoing named systematictreatmenongoing 0..1

* extension contains SystematicTreatmentSetting named systematictreatmentsetting 0..1





Extension: CancerProgressionReferenceST
Id: cancer-progression-reference-st
Title: "Cancer Progression Reference Systematic Treatment"
Description: "A reference for stating the cancer progression"
Context: EpisodeOfCare
* value[x] only Reference(ObservationCancerProgression)


Extension: SystematicTreatmentIntent
Id: systematic-treatemmt-intent
Title: "Systematic Treatment Intent"
Description: "Indicates which intent the systematic treatment had."
Context: EpisodeOfCare
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from SystematicTreatmentIntentVS (required)

// Is this the same valueset as in surgery? If yes, than one value set for both
ValueSet: SystematicTreatmentIntentVS
Id: systematic-treatment-intent-vs
Title: "Intent of Systematic Treatment"
Description: "Determinse the intent of the systematic treatment."
* ^status = #draft
* ^experimental = false
* $sct#363676003 "Palliative - procedure intent (qualifier value)"
* $sct#373808002 "Curative - procedure intent (qualifier value)"

Extension: SystematicTreatmentOngoing
Id: systematic-treatemmt-ongoing
Title: "Systematic Treatment Ongoing"
Description: "Indicates that the treatment is ongoing when EndDate is not available."
Context: EpisodeOfCare
* value[x] only boolean
* value[x] 1..1


Extension: SystematicTreatmentSetting
Id: systematic-treatment-setting
Title: "Systematic Treatment Settinf"
Description: "Strategic timing/setting of systematic treatment (e.g. neoadjuvant, adjuvant, concomitant, alone)."
Context: EpisodeOfCare
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from SystematicTreatmentSettingVS (required)

// Check Value set, alone is unclear..
ValueSet: SystematicTreatmentSettingVS
Id: systematic-treatment-setting-vs
Title: "Value Set for strategic timing/setting of systematic treatment"
Description: "Determinse the setting of the systematic treatment."
* ^status = #draft
* ^experimental = false
* $sct#79970003 "Simultaneous (qualifier value)"
* $sct#262061000 "Postoperative period (qualifier value)"
* $sct#262068006 "Preoperative (qualifier value)"
* $sct#229803000 "Single episode (qualifier value)"
