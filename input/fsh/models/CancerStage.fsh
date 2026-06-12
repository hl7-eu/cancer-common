Logical: CancerStage
Id: CancerStage
Title: "CancerStage"
Description: "Logical model representing the cancer stage at the time of first diagnosis. The stage may be clinical or pathological: the clinical stage is derived from imaging evidence, while the pathological stage, when available, is derived from surgical evidence. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet CancerStage)."
Characteristics: #can-be-target

* obeys cs-ev-e1
* obeys cs-ev-e2
* obeys cs-tnm-1
* obeys cs-nontnm-1
* cancerConditionAtDiagnosisReference 1..1 Reference(CancerConditionAtDiagnosis) "CancerCondition AtDiagnosis Reference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at first diagnosis for which the stage is reported."
* classificationType 0..1 CodeableConcept "ClassificationType"
* classificationType ^definition = "Staging classification system used when the staging system needs to be explicitly identified (e.g. TNM)."
* classificationType ^comment = "For TNM, this element should be populated with 'TNM'. For single-value systems, it may be omitted when the system/measure is represented through stageComponent.code."
* stage 1..* BackboneElement "StageValue"
* stage ^definition = "One or more staging values expressed as (code, value) pairs."
* stage ^comment = "Most staging systems are represented by a single component. TNM is represented by three components, one for each of T, N, and M (codes 'T', 'N', 'M')."
* stage.code 1..1 CodeableConcept "Stage element code"
* stage.code ^definition = "Identifies which staging element is being reported (e.g. T category, N category, M category, stage group)."
* stage.code ^comment = "For single-value staging systems, this represents the staging system/measure being used (e.g. 'FIGO stage group'). For TNM, expected codes include 'T', 'N', and 'M'."
* stage.value 1..1 CodeableConcept "Stage element value"
* stage.value ^definition = "Value associated with the reported staging element (e.g. T2, N1, M0; or a stage group value)."
* stage.value ^comment = "For TNM, this carries the component value (e.g. T2, N0, M0). For single-value systems, this carries the stage group/value (e.g. IIIB)."
* type 1..1 CodeableConcept "Type"
* type ^definition = "It indicates whether the stage instance is of type Clinical or Pathological."
* type ^comment = "It indicates whether the stage instance is of type Clinical or Pathological. Choice: Clinical | Pathological"
* evidenceReference 0..* Reference(Surgery or Imaging) "EvidenceReference"
* evidenceReference ^definition = "Reference(s) to the evidence used to define the stage: imaging in case of a Clinical stage, or surgery in case of a Pathological stage."
* evidenceReference ^comment = "It shall be present. The reference shall be to one or more imaging procedures in case the stage is Clinical, or to one surgery in case the stage is Pathological."

/* * surgeryReference 0..1 Reference(Surgery) "SurgeryReference"
* surgeryReference ^definition = "It shall be present when the stage is of type Pathological and shall not be present when the stage is of type Clinical."
* imagingReference 0..* Reference(Imaging) "ImagingReference"
* imagingReference ^definition = "It shall be present when the stage is of type Clinical and shall not be present when the stage is of type Pathological." */


Invariant: cs-ev-e1
Description: "If type is Clinical, imaging evidence must not be provided."
Severity: #error
//Imaging type is not known
//Expression: "type.text = 'Clinical' implies evidenceReference.resolve().ofType(Imaging).empty()"
Invariant: cs-ev-e2
Description: "If type is Pathological, surgery evidence must not be provided."
Severity: #error
//Surgery type is not known
//Expression: "type.text = 'Pathological' implies evidenceReference.resolve().ofType(Surgery).empty()"
Invariant: cs-tnm-1
Description: "If classificationType is TNM, 3 values is expected."
Severity: #warning
Expression: "classificationType.text = 'TNM' implies stage.count() >= 3"
Invariant: cs-nontnm-1
Description: "For non-TNM staging systems, a single value is typically expected."
Severity: #warning
Expression: "classificationType.text != 'TNM' implies stage.count() = 1"
