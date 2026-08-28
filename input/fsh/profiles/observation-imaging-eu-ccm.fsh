//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationImagingEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-imaging-eu-ccm
Title: "Observation Imaging (CCM)"
Description: """This informative profile constrains the Observation resource to represent the Imaging method and location done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code = $sct#360037004 "Imaging - action (qualifier value)" // No suitable LOINC Code found

* method 1..1
* method ^definition = "Represents the type of imaging procedure performed (e.g. thoracic MRI)"

* bodySite 1..1
* bodySite ^definition = "Anatomical site on which the imaging procedure was performed. For each site a new Observation must be created."

* extension contains AdditionalBodySite named additionalBodySite 0..*

Extension: AdditionalBodySite
Id: additional-body-site
Title: "Additional Body Site"
Description: "An additional anatomical site associated with the observation, beyond the primary Observation.bodySite. Use one instance of this extension per additional site."
Context: Observation
* value[x] only CodeableConcept
* value[x] 1..1