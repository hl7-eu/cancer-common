
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CancerConditionAtDiagnosisEuCcm
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Parent:   Condition
Id:       cancer-condition-at-diagnosis-eu-ccm
Title:    "Cancer Condition at Diagnosis (CCM)"
Description: "This informative profile defines how to represent the Cancer Consition at Diagnosis in FHIR for the purpose of the ECCDM. It is provided as future implementation-oriented content in this publication and is expected to evolve in subsequent iterations of this guide."
* insert SetFmmandStatusRule ( 0, informative )

//-------------------------------------------------------------------------------------------
* . ^short = "Information about the cancer condition at the point of diagnosis."
* . ^definition = "Information about the cancer condition at the point of diagnosis."

* subject only Reference(PatientEuCcm)
* subject 1..1
* subject ^definition = "The patient whose cancer condition is being diagnosed"

* bodySite 1..1
* bodySite ^comment = "It is required to choose the most specific code available, meaning the most detailed code in the hierarchical terminology that precisely identifies the body site."

* stage 0..
* stage.type ^short = "Represents the classification system used to define the tumour grade"
* stage.summary ^short = "Represents the measured grade value based on the specific classification defined in the Stage Type Element."

* extension contains DiagnosisDate named diagnosisDate 1..1

* extension contains HistologyBehaviour named HistologyBehaviour 0..1

* obeys diagnosis-date-required

Extension: DiagnosisDate
Id: diagnosis-date
Title: "Diagnosis Date"
Description: "Grouping of the possible dates evidencing the diagnosis of a Cancer Condition. At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present."
Context: Condition
* extension contains
    VisitDate 0..1 and
    BiopsyDate 0..1 and
    ImagingDate 0..1 and
    LabReportDate 0..1
* extension[VisitDate].value[x] only dateTime
* extension[VisitDate] ^short = "Visit date"
* extension[VisitDate] ^definition = "Date of the clinical visit that established the diagnosis."
* extension[BiopsyDate].value[x] only dateTime
* extension[BiopsyDate] ^short = "Biopsy Date"
* extension[BiopsyDate] ^definition = "Date of the biopsy supporting the diagnosis."
* extension[ImagingDate].value[x] only dateTime
* extension[ImagingDate] ^short = "Imaging Date"
* extension[ImagingDate] ^definition = "Date of the diagnostic imaging supporting the diagnosis."
* extension[LabReportDate].value[x] only dateTime
* extension[LabReportDate] ^short = "Lab Date"
* extension[LabReportDate] ^definition = "Date of the laboratory report supporting the diagnosis, including biomarkers when applicable."

Extension: HistologyBehaviour
Id: cancer-histology-behaviour-reference
Title: "Histology Behaviour"
Description: "A reference to descirbe the histology behaviour of the tumor through an observation."
Context: Condition
* value[x] only Reference(ObservationHitsologyBehaviourEuCcm)

Invariant: diagnosis-date-required
Description: "At least one of VisitDate, BiopsyDate, ImagingDate, LabReportDate must be present."
Severity: #error
Expression: "extension('http://hl7.eu/fhir/cancer-common/StructureDefinition/diagnosis-date').extension.where(url = 'VisitDate' or url = 'BiopsyDate' or url = 'ImagingDate' or url = 'LabReportDate').exists()"

