//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationCancerStage
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-cancer-stage-eu-ccm
Title: "Observation: Cancer Stage"
Description: """This informative profile constrains the Observation resource to represent the Cancer Stage for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code ^short = "Represents the classification system to define the stage"
* code ^comment = "For TNM, this element should be populated with 'TNM'. For single-value systems, it may be omitted when the system/measure is represented through component.Code"


* focus only Reference(CancerConditionAtDiagnosisEuCcm)
* focus 1..
* focus ^definition = "The cancer condition which stage is defined."


* component 1..*
* component.code ^short = "For single-value staging systems, this represents the staging system/measure being used (e.g. 'FIGO stage group'). For TNM, expected codes include 'T', 'N', and 'M'."
* component.value[x] only CodeableConcept
* component.value[x] 1..1
* component.value[x] ^short = "For TNM, this carries the component value (e.g. T2, N0, M0). For single-value systems, this carries the stage group/value (e.g. IIIB)."


* extension contains ClinicalOrPathological named clinicalorpathological 1..1
* extension contains EvidenceReference named evidencereference 0..*


Extension: ClinicalOrPathological
Id: clinical-or-pathological
Title: "Clinical or Pathological"
Description: "Indicates whether the reported cancer stage was determined clinically or pathologically."
Context: Observation
* ^status = #draft
* ^experimental = false
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from ClinicalOrPathologicalVS (required)


Extension: EvidenceReference
Id: cancer-stage-evidence-reference
Title: "Evidence Reference"
Description: "A reference to supporting evidence (e.g. an imaging or pathology report) for the reported cancer stage. It shall be present. The reference shall be to one or more imaging (in case the stage is Clinical) or to one surgery (in case the stage is Pathological)."
Context: Observation
* value[x] only Reference(Procedure or DiagnosticReport or Observation)

ValueSet: ClinicalOrPathologicalVS
Id: clinical-or-pathological-vs
Title: "Clinical or Pathological"
Description: "Whether the cancer stage was determined clinically or pathologically."
* ^status = #draft
* ^experimental = false
* $sct#260998006 "Clinical staging (qualifier value)"
* $sct#261023001 "Pathological staging (qualifier value)"

