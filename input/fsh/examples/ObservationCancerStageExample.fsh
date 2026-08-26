Instance: ObservationCancerStage1-Example
InstanceOf: observation-cancer-stage-eu-ccm
Usage: #example
Description: "Example comorbidity observation documenting the Charlson Comorbidity Index and associated comorbid conditions."

* status = #final
* code = $loinc#67204-8 "Deprecated TNM clinical staging [PhenX]"

* focus = Reference(ConditionAtDiagnosis1-Example)

* component[0].code = $loinc#67205-5 "Deprecated TNM clinical staging - primary tumor - T [PhenX]"
* component[0].valueCodeableConcept = $loinc#LA3628-0 "T2"

* component[1].code = $loinc#67206-3 "Deprecated TNM clinical staging - nodal involvement - N [PhenX]"
* component[1].valueCodeableConcept = $loinc#LA4368-2 "N0"

* component[2].code = $loinc#67207-1 "Deprecated TNM clinical staging - distant metastases - M [PhenX]"
* component[2].valueCodeableConcept = $loinc#LA4629-7 "M0"

* extension[CinicalorPathological].valueCodeableConcept = $sct#260998006 "Clinical staging (qualifier value)"

* extension[EvidenceReference].valueReference = Reference(Imaging-Cancer-Stage)

Instance: Imaging-Cancer-Stage
InstanceOf: observation-imaging-eu-ccm
Usage: #example
Description: "Example of the observation of a imaging done on the patient."

* status = #final 

* code = $sct#360037004 "Imaging - action (qualifier value)"

* method = $sct#113091000 "Magnetic resonance imaging (procedure)"

* bodySite = $sct#22943007 "Trunk structure (body structure)"

* subject = Reference(Patient1-Example)
