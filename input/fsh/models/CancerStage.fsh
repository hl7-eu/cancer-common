Logical: CancerStage
Id: CancerStage
Title: "CancerStage"
Description: "CancerStage logical model from Cancer_Common_Logical_Model_20260408.xlsx (sheet CancerStage)."
Characteristics: #can-be-target

* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at first diagnosis for which the stage is reported."
* classificationType 1..1 CodeableConcept "ClassificationType"
* classificationType ^definition = "Staging classification system used (e.g. TNM)."
* classificationType ^comment = "It represents the classification system to define the stage, such as TNM (Tumour Linphonode Metastasis)."
* value 1..* Element "Value"
* value ^definition = "Stage value(s) as defined by the applied staging system (structure depends on the system)."
* value ^comment = "It represents the stage value. Its datatype and cardinality depend on the specific structure of the staging classification being used. For example, in the case of the TNM classification, three string values are expected: one for T (Tumour), one for N (Nodes), and one for M (Metastasis)."
* type 1..1 CodeableConcept "Type"
* type ^definition = "It indicates whether the stage instance is of type Clinical or Pathological."
* type ^comment = "It indicates whether the stage instance is of type Clinical or Pathological. Choice: Clinical | Pathological"
* EvidenceReference[x] 0..* Surgery or Imaging "EvidenceReference"
* EvidenceReference[x] ^definition = "Reference(s) to imaging (in case the stage is Clinical) or to surgery (in case the stage is Pathological)."
* EvidenceReference[x] ^comment = "It shall be present. The reference shall be to one or more imaging (in case the stage is Clinical) or to one surgery (in case the stage is Pathological)."

/* * surgeryReference 0..1 Reference(Surgery) "SurgeryReference"
* surgeryReference ^definition = "It shall be present when the stage is of type Pathological and shall not be present when the stage is of type Clinical."
* imagingReference 0..* Reference(Imaging) "ImagingReference"
* imagingReference ^definition = "It shall be present when the stage is of type Clinical and shall not be present when the stage is of type Pathological." */
