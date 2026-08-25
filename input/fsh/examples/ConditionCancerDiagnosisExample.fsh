Instance: ConditionAtDiagnosis1-Example
InstanceOf: cancer-condition-at-diagnosis-eu-ccm
Usage: #example
Description: "Example of a cancer stage reposrted."


* subject = Reference(Patient1-Example)

* bodySite = $icd10#C34.3 "Lower lobe, bronchus or lung"

* stage.type = $sct#277457005 "Histological grading systems (staging scale)"
* stage.summary.text = "G3"

* extension[diagnosisDate].extension[VisitDate].valueDateTime = "2024-01-15T10:00:00+01:00"

