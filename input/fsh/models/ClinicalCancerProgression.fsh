Logical: ClinicalCancerProgression
Id: ClinicalCancerProgression
Title: "ClinicalCancerProgression"
Description: "ClinicalCancerProgression logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet ClinicalCancerProgression)."
Characteristics: #can-be-target

* obeys ccp-1
* obeys ccp-2
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerConditionReference"
* diseaseStatus 1..1 CodeableConcept "DiseaseStatus"
* diseaseStatus ^definition = "Choice: Progression | Stable Disease | Partial Remission | Complete Remission | Recurrence"
* tumourGradeSystem 0..1 CodeableConcept "TumourGradeSystem"
* tumourGradeValue 0..1 string "TumourGradeValue"
* assertedDate 1..1 dateTime "AssertedDate"
* extentType 0..1 CodeableConcept "ExtentType"
* extentType ^definition = "Choice: Local | Loco-regional | Metastatic"
* locoRegionalSites 0..* CodeableConcept "LocoRegionalSites"
* locoRegionalSites ^definition = "It must be present if the ExtentType is Loco-regional"
* metastaticSites 0..* CodeableConcept "MetastaticSites"
* metastaticSites ^definition = "It must be present if the ExtentType is Metastatic"

Invariant: ccp-1
Description: "LocoRegionalSites must be present if ExtentType is Loco-regional"
Expression: "extentType.coding.where(code = 'Loco-regional').exists() implies locoRegionalSites.exists()"
Severity: #error

Invariant: ccp-2
Description: "MetastaticSites must be present if ExtentType is Metastatic"
Expression: "extentType.coding.where(code = 'Metastatic').exists() implies metastaticSites.exists()"
Severity: #error
