Instance: OverallCancerTreatmentResponse2-Example
Title: "Overall Cancer Treatment Response 2 Example"
Description: "Example overall treatment response documenting partial remission on 2020-01-02."
InstanceOf: OverallCancerTreatmentResponse
Usage: #example

* cancerConditionAtDiagnosisReference = Reference(CancerConditionAtDiagnosis1-Example)
* clinicalCancerProgressionReference = Reference(ClinicalCancerProgression4-Example)
* treatmentResponseType.text = "Partial Remission"
* date = "2020-01-02"
