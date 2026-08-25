//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationImagingEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-imaging-eu-ccm
Title: "Observation: Imaging"
Description: """This informative profile constrains the Observation resource to represent the Imaging methode and location done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code = $sct#360037004 "Imaging - action (qualifier value)" // No suitable LOINC Code found

* method 1..1
* method ^definition = "Represents the type of imaging procedure performed (e.g. thoracic MRI)"

* bodySite 1..1
* bodySite ^definition = "Anatomical site on which the imaging procedure was performed. For each site a new Observation must be created."


* subject only Reference(PatientEuCcm)
* subject 1..
* subject ^definition = "The patient on which the imaging was done."

