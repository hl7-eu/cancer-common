Logical: ClinicalCancerProgression
Id: ClinicalCancerProgression
Title: "ClinicalCancerProgression"
Description: "ClinicalCancerProgression logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet ClinicalCancerProgression)."
Characteristics: #can-be-target

* cancerConditionReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerConditionReference"
* diseaseStatus 1..1 CodeableConcept "DiseaseStatus"
* diseaseStatus ^definition = "Choice: Progression | Stable Disease | Partial Remission | Complete Remission | Recurrence"
* tumourGradingSystem 0..1 CodeableConcept "TumourGradingSystem"
* tumourGradeValue 0..1 string "TumourGradeValue"
* assertedDate 1..1 dateTime "AssertedDate"
* extentType 0..1 CodeableConcept "ExtentType"
* extentType ^definition = "Choice: Local | Loco-regional | Metastatic"
* locoRegionalSites 0..* CodeableConcept "LocoRegionalSites"
* locoRegionalSites ^definition = "It must be present if the ExtentType is Loco-regional"
* metastaticSites 0..* CodeableConcept "MetastaticSites"
* metastaticSites ^definition = "It must be present if the ExtentType is Metastatic"
