Logical: ClinicalCancerProgression
Id: ClinicalCancerProgression
Title: "ClinicalCancerProgression"
Description: "ClinicalCancerProgression logical model from Cancer_Common_Logical_Model_20260408.xlsx  (sheet ClinicalCancerProgression)."
Characteristics: #can-be-target

* obeys ccp-1
* obeys ccp-2
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerConditionReference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the original cancer condition at diagnosis to which this progression refers."
* diseaseStatus 1..1 CodeableConcept "DiseaseStatus"
* diseaseStatus ^definition = "Disease status at this time point (e.g. progression, stable disease, remission, recurrence)."
* diseaseStatus ^comment = "Choice: Progression | Stable Disease | Partial Remission | Complete Remission | Recurrence"
* tumourGradeSystem 0..1 CodeableConcept "TumourGradeSystem"
* tumourGradeSystem ^definition = "Classification system used to define tumour grade, describing how abnormal tumour cells and tissue appear under microscopic examination (e.g. Gleason for prostate cancer, FNCLCC for soft tissue sarcomas). The grading system provides an indication of the biological aggressiveness of the tumour."
* tumourGradeValue 0..1 string "TumourGradeValue"
* tumourGradeValue ^definition = "Grade value assigned according to the selected TumourGradeSystem. The grade reflects the degree of cellular differentiation and biological aggressiveness of the tumour and may evolve over time."
* assertedDate 1..1 dateTime "AssertedDate"
* assertedDate ^definition = "Date when this progression/status was asserted/recorded."
* extentType 0..1 CodeableConcept "ExtentType"
* extentType ^definition = "Extent of disease at this time point (Local, Loco-regional, Metastatic)."
* extentType ^comment = "Choice: Local | Loco-regional | Metastatic"
* locoRegionalSites 0..* CodeableConcept "LocoRegionalSites"
* locoRegionalSites ^definition = "Sites involved when ExtentType is Loco-regional."
* locoRegionalSites ^definition = "It must be present if the ExtentType is Loco-regional"
* metastaticSites 0..* CodeableConcept "MetastaticSites"
* metastaticSites ^definition = "Sites involved when ExtentType is Metastatic."
* metastaticSites ^definition = "It must be present if the ExtentType is Metastatic"

Invariant: ccp-1
Description: "LocoRegionalSites must be present if ExtentType is Loco-regional"
Expression: "extentType.coding.where(code = 'Loco-regional').exists() implies locoRegionalSites.exists()"
Severity: #error

Invariant: ccp-2
Description: "MetastaticSites must be present if ExtentType is Metastatic"
Expression: "extentType.coding.where(code = 'Metastatic').exists() implies metastaticSites.exists()"
Severity: #error
