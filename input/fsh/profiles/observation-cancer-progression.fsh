//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationCancerProgression
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-cancer-progression-eu-ccm
Title: "Observation: Cancer Progression"
Description: """This informative profile constrains the Observation resource to represent the cancer prgression done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""


* insert SetFmmandStatusRule ( 0, informative )
* code = $loinc#97509-4 "Cancer disease progression" 

* focus only Reference(CancerConditionAtDiagnosisEuCcm)
* focus 1..
* focus ^definition = "The cancer condition which stage is defined."


* valueCodeableConcept from DiseaseStatusVS (required)

* component 0..1
* component.code ^short = "Classification system used to define tumour grade."
* component.value[x] only string
* component.value[x] 1..1
* component.value[x] ^short = "Grade value assigned according to the selected TumourGradeSystem."

* effectiveDateTime 1..1
* effectiveDateTime ^short = "Date when the status was recoded."



* extension contains ExtentType named extenttype 0..1

* extension contains LocoRegionalSites named locoregionalsites 0..*

* extension contains MetastaticSites named metastaticsites 0..*

* obeys loco-regional-or-metatstatic-sites-1


Extension: ExtentType
Id: extent-type
Title: "Evidence of Disease"
Description: "Extent of disease at this time point (Local, Loco-regional, Metastatic)."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from ExtentTypeVS (required)


Extension: LocoRegionalSites
Id: loco-regional-sites
Title: "Loco-regional Site"
Description: "Sites involved when ExtentType is Loco-regional."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1

Extension: MetastaticSites
Id: metastatic-sites
Title: "Metastatic Site"
Description: "Sites involved when ExtentType is Metastatic."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1




// ValueSet needs improvement! Not final!
ValueSet: DiseaseStatusVS
Id: disease-status-vs
Title: "Disease Status"
Description: "This Value Set describes the status of the cancer disease."
* ^status = #draft
* ^experimental = false
* $sct#263853000 "Recurrent episode (qualifier value)"
* $sct#103338009 "In full remission (qualifier value)"
* $sct#103337004 "In partial remission (qualifier value)"
* $sct#419835002 "Tumor progression (finding)"
* $sct#359748005 "Patient condition unchanged (finding)" 


// ValueSet needs improvement! Not final!
ValueSet: ExtentTypeVS
Id: extent-type-vs
Title: "Extent Type"
Description: "This Value Set describes the extent of disease at this timepoint"
* ^status = #draft
* ^experimental = false
* $sct#410674003 "Regional (qualifier value)"
* $sct#255470001 "Local (qualifier value)"
* $sct#14799000 "Neoplasm, metastatic (morphologic abnormality)"







Invariant: loco-regional-or-metatstatic-sites-1
Description: "If the ExtentType is loco-regional the loco-regioal site must be present, if the Extent Type is metastatic the metastatic-site must be present"
Severity: #error
Expression: "(extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/extent-type').value.coding.code = '410674003' implies extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/loco-regional-sites').exists()) and (extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/extent-type').value.coding.code = '14799000' implies extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/metastatic-sites').exists())"