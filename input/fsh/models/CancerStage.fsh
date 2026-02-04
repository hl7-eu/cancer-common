Logical: CancerStage
Id: CancerStage
Title: "CancerStage"
Description: "CancerStage logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet CancerStage)."
Characteristics: #can-be-target

* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* classificationType 1..1 CodeableConcept "ClassificationType"
* classificationType ^definition = "It represents the classification system to define the stage, such as TNM (Tumor Linphonode Metastasis). nan"
* value 1..* Element "Value"
* value ^definition = "It represents the stage value. Its datatype and cardinality depend on the specific structure of the staging classification being used. For example, in the case of the TNM classification, three string values are expected: one for T (Tumor), one for N (Nodes), and one for M (Metastasis). nan"
* type 1..1 CodeableConcept "Type"
* type ^definition = "It indicates whether the stage instance is of type Clinical or Pathological. Choice: Clinical | Pathological"
* surgeryReference 0..1 Reference(Surgery) "SurgeryReference"
* surgeryReference ^definition = "It shall be present when the stage is of type Pathological and shall not be present when the stage is of type Clinical. nan"
* imagingReference 0..* Reference(Imaging) "ImagingReference"
* imagingReference ^definition = "It shall be present when the stage is of type Clinical and shall not be present when the stage is of type Pathological. nan"
