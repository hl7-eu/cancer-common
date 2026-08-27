//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationCancerStage
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-cancer-stage-eu-ccm
Title: "Observation Cancer Stage (CCM)"
Description: """This informative profile constrains the Observation resource to represent the Cancer Stage for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code ^short = "Represents the classification system to define the stage"
* code ^comment = "For TNM, this element should be populated with 'TNM'. For single-value staging systems, this represents the staging system/measure being used (e.g. 'FIGO stage group') "

* focus only Reference(CancerConditionAtDiagnosisEuCcm)
* focus 1..
* focus ^definition = "The cancer condition which stage is defined."

* value[x] 0..1
* value[x] ^definition = "For single-value systems, this carries the stage group/value (e.g. IIIB)."

* component 0..*
* component.code ^short = "For TNM, expected codes include 'T', 'N', and 'M'."
* component.value[x] only CodeableConcept
* component.value[x] 1..1
* component.value[x] ^short = "For TNM, this carries the component value (e.g. T2, N0, M0). "


* extension contains
    CinicalOrPathological named CinicalOrPathological 1..1 and
    EvidenceReferenceImaging named EvidenceReferenceImaging 0..* and
    EvidenceReferenceSurgery named EvidenceReferenceSurgery 0..*

* extension[EvidenceReferenceImaging] ^short = "Supporting imaging evidence for the stage. Only applicable when ClinicalOrPathological is 'Clinical staging'."
* extension[EvidenceReferenceSurgery] ^short = "Supporting surgery evidence for the stage. Only applicable when ClinicalOrPathological is 'Pathological staging'."

* obeys evidence-reference-matches-clinical-or-pathological
* obeys stage-value-or-component

Extension: CinicalOrPathological
Id: clinical-or-pathological
Title: "Clinical or Pathological"
Description: "Indicates whether the reported cancer stage was determined clinically or pathologically."
Context: Observation
* ^status = #draft
* ^experimental = false
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from ClinicalOrPathologicalVS (required)


Extension: EvidenceReferenceImaging
Id: cancer-stage-evidence-reference-imaging
Title: "Evidence Reference (Imaging)"
Description: "A reference to the imaging study supporting a clinically-determined cancer stage."
Context: Observation
* ^status = #draft
* ^experimental = false
* value[x] only Reference(ObservationImagingEuCcm)
* value[x] 1..1


Extension: EvidenceReferenceSurgery
Id: cancer-stage-evidence-reference-surgery
Title: "Evidence Reference (Surgery)"
Description: "A reference to the surgical procedure supporting a pathologically-determined cancer stage."
Context: Observation
* ^status = #draft
* ^experimental = false
* value[x] only Reference(ProcedureSurgeryEuCcm)
* value[x] 1..1


ValueSet: ClinicalOrPathologicalVS
Id: clinical-or-pathological-vs
Title: "Clinical or Pathological"
Description: "Whether the cancer stage was determined clinically or pathologically."
* ^status = #draft
* ^experimental = false
* $sct#260998006 "Clinical staging (qualifier value)"
* $sct#261023001 "Pathological staging (qualifier value)"


Invariant: evidence-reference-matches-clinical-or-pathological
Description: "When ClinicalOrPathological is 'Clinical staging', EvidenceReferenceSurgery shall not be present. When ClinicalOrPathological is 'Pathological staging', EvidenceReferenceImaging shall not be present."
Severity: #error
Expression: "(extension('http://hl7.org/fhir/StructureDefinition/clinical-or-pathological').value.coding.where(code = '260998006').exists() implies extension('http://hl7.org/fhir/StructureDefinition/cancer-stage-evidence-reference-surgery').empty()) and (extension('http://hl7.org/fhir/StructureDefinition/clinical-or-pathological').value.coding.where(code = '261023001').exists() implies extension('http://hl7.org/fhir/StructureDefinition/cancer-stage-evidence-reference-imaging').empty())"

Invariant: stage-value-or-component
Description: "Either value[x] or component must be present."
Severity: #error
Expression: "value.exists() or component.exists()"