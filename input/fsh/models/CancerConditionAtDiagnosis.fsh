Logical: CancerConditionAtDiagnosis
Id: CancerConditionAtDiagnosis
Title: "CancerCondition (AtDiagnosis)"
Description: "CancerCondition (AtDiagnosis) logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet CancerCondition(AtDiagnosis))."
Characteristics: #can-be-target

* obeys ccad-1
* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) affected by the cancer condition at first diagnosis."
* histologyBehaviour 0..1 CodeableConcept "HistologyBehaviour"
* histologyBehaviour ^definition = "Histology and behaviour of the neoplasm at first diagnosis. Histology describes the tumour cell type (morphology), while behaviour indicates whether the tumour is malignant, benign, carcinoma in situ, or of uncertain/borderline malignancy. This information may be unavailable during early diagnostic workup (e.g., before biopsy results are final) but is expected to be present once the diagnostic workup is completed."
* histologyBehaviour ^comment = "WG recommends ICD03, the WG will monitor possible next versions. This attribute becomes mandatory once the cancer has been diagnosed; however, during the diagnostic workup it may still be absent, as the biopsy resulting from the surgery may not yet be available."
* bodySite 1..1 CodeableConcept "BodySite"
* bodySite ^definition = "WG reccomends ICD03, the WG will monitor possible next versions. It is required to choose the most specific code available, meaning the most detailed code in the hierarchical terminology that precisely identifies the body site."
* tumourGradeSystem 1..1 CodeableConcept "TumourGradeSystem"
* tumourGradeSystem ^definition = "It represents the classification system used to define the tumor grade, such as Gleason (a grading system for prostate cancer) or FNCLCC (a grading system for soft tissue sarcomas). We need to determine the appropriate cardinality."
* tumourGradeValue 1..1 string "TumourGradeValue"
* tumourGradeValue ^definition = "It represents the measured grade value based on the specific classification defined in the TumorGradingSystem. We need to determine the appropriate cardinality."
* visitDate 0..1 dateTime "VisitDate"
* visitDate ^definition = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
* biopsyDate 0..1 dateTime "BiopsyDate"
* biopsyDate ^definition = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
* imagingDate 0..1 dateTime "ImagingDate"
* imagingDate ^definition = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
* labReportDate 0..1 dateTime "LabReportDate"
* labReportDate ^definition = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."

Invariant: ccad-1
Description: "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
Severity: #error
Expression: "(visitDate | biopsyDate | imagingDate | labReportDate).exists()"