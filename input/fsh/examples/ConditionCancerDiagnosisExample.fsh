Instance: ConditionAtDiagnosis1-Example
InstanceOf: cancer-condition-at-diagnosis-eu-ccm
Usage: #example
Description: "Example of a cancer diagnosis reported."


* subject = Reference(Patient1-Example)

* bodySite = $icd03#C34.3 "Lower lobe, bronchus or lung"

* stage.type = $sct#277457005 "Histological grading systems (staging scale)"
* stage.summary.text = "G3"

* extension[diagnosisDate].extension[VisitDate].valueDateTime = "2024-01-15T10:00:00+01:00"

* extension[HistologyBehaviour].valueReference  = Reference(ObservationHistologyBehaviour1-Example)


Instance: ObservationHistologyBehaviour1-Example
InstanceOf: observation-histology-behaviour-eu-ccm
Usage: #example
Description: "Example of the histology behaviour of a cancer at first diagnosis."

* status = #final

* code = $sct#395531003 "Neoplasm observable (observable entity)"

* valueCodeableConcept = $icd03#8140/3 "Adenocarcinoma, NOS"




Instance: ConditionAtDiagnosis2-Example
InstanceOf: cancer-condition-at-diagnosis-eu-ccm
Usage: #example
Description: "Example of a cancer diagnosis reported."


* subject = Reference(Patient1-Example)

* bodySite = $icd03#C54.1 "Endometrium"

* stage.type = $sct#277457005 "Histological grading systems (staging scale)"
* stage.summary.text = "G3"

* extension[diagnosisDate].extension[VisitDate].valueDateTime = "2025-01-15T10:00:00+01:00"

