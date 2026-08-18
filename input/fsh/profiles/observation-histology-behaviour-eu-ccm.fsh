//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: ObservationHitsologyBehaviourEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: Observation
Id: observation-histology-behaviour-eu-ccm
Title: "Observation: Histology Behaviour"
Description: """This informative profile constrains the Observation resource to represent the Histology behaviour of the neoplasm at the firt diagnosis for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""
* insert SetFmmandStatusRule ( 0, informative )
* code = $sct#95531003 "Neoplasm observable (observable entity)" 
* valueCodeableConcept 1..
* valueCodeableConcept ^short = "Histology and behaviour of the neoplasm at first diagnosis."
* valueCodeableConcept ^definition = "Histology and behaviour of the neoplasm at first diagnosis. Histology describes the tumour cell type (morphology), while behaviour indicates whether the tumour is malignant, benign, carcinoma in situ, or of uncertain/borderline malignancy. This information may be unavailable during early diagnostic workup (e.g., before biopsy results are final) but is expected to be present once the diagnostic workup is completed."

* focus only Reference(CancerConditionAtDiagnosisEuCcm)
* focus 1..
* focus ^definition = "The condition which histology or behaviour is defined."





