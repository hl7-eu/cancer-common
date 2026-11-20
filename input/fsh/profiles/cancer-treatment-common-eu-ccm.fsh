//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Shared extensions and value sets for the cancer treatment Procedure profiles
// (ProcedureRadiotherapyEuCcm, ProcedureSystemicTreatmentEuCcm).
// Surgery still carries its own SurgeryIntent extension; consolidation is a follow-up.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Extension: CancerTreatmentIntent
Id: cancer-treatment-intent
Title: "Cancer Treatment Intent"
Description: "Intent of a cancer treatment course (curative/definitive vs palliative). Corresponds to the 'intent' element of the Radiotherapy and SystemicTreatment logical models."
Context: Procedure
* insert SetFmmandStatusRule ( 0, informative )
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from CancerTreatmentIntentVS (required)

ValueSet: CancerTreatmentIntentVS
Id: cancer-treatment-intent-vs
Title: "Cancer Treatment Intent"
Description: "Intent of a cancer treatment course: curative (definitive) or palliative."
* ^status = #draft
* ^experimental = false
* $sct#373808002 "Curative - procedure intent (qualifier value)"
* $sct#363676003 "Palliative - procedure intent (qualifier value)"

Extension: CancerTreatmentSetting
Id: cancer-treatment-setting
Title: "Cancer Treatment Setting"
Description: "Strategic timing/setting of a cancer treatment course relative to other treatments (e.g. neoadjuvant, adjuvant, concomitant, alone). Corresponds to the 'setting' element of the Radiotherapy and SystemicTreatment logical models."
Context: Procedure
* insert SetFmmandStatusRule ( 0, informative )
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from CancerTreatmentSettingVS (required)

// Codes to be reviewed: the logical model lists Alone | Preoperative/Neoadjuvant | Postoperative/Adjuvant | Concomitant.
ValueSet: CancerTreatmentSettingVS
Id: cancer-treatment-setting-vs
Title: "Cancer Treatment Setting"
Description: "Strategic timing/setting of a cancer treatment course: alone, preoperative (neoadjuvant), postoperative (adjuvant) or concomitant."
* ^status = #draft
* ^experimental = false
* $sct#229803000 "Single episode (qualifier value)"
* $sct#262068006 "Preoperative (qualifier value)"
* $sct#262061000 "Postoperative period (qualifier value)"
* $sct#79970003 "Simultaneous (qualifier value)"
