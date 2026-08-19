//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: EOCActiveSurveillance
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent: EpisodeOfCare
Id: episode-of-care-surveillance-eu-ccm
Title: "Episode of Care: Active Surveillance"
Description: """This informative profile constrains the EpisodeOfCare resource to represent the Active Surveillance done for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide.
This profiles is adapted from the mCode FHIR Implementation Guide
"""


* insert SetFmmandStatusRule ( 0, informative )

* patient only Reference(PatientEuCcm)

* diagnosis 1..1
* diagnosis.condition only Reference(CancerConditionAtDiagnosisEuCcm)

* period 1..1
* period.start 1..1

