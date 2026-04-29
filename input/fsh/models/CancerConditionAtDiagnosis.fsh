Logical: CancerConditionAtDiagnosis
Id: CancerConditionAtDiagnosis
Title: "CancerCondition (AtDiagnosis)"
Description: "CancerCondition (AtDiagnosis) logical model from Cancer_Common_Logical_Model_20260408.xlsx (sheet CancerConditionAtDiagnosis)."
Characteristics: #can-be-target

* obeys ccad-1
* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) affected by the cancer condition at first diagnosis."
* histologyBehaviour 0..1 CodeableConcept "HistologyBehaviour"
* histologyBehaviour ^definition = "Histology and behaviour of the neoplasm at first diagnosis. Histology describes the tumour cell type (morphology), while behaviour indicates whether the tumour is malignant, benign, carcinoma in situ, or of uncertain/borderline malignancy. This information may be unavailable during early diagnostic workup (e.g., before biopsy results are final) but is expected to be present once the diagnostic workup is completed."
* histologyBehaviour ^comment = "WG recommends ICD03, the WG will monitor possible next versions. This attribute becomes mandatory once the cancer has been diagnosed; however, during the diagnostic workup it may still be absent, as the biopsy resulting from the surgery may not yet be available."
* bodySite 1..1 CodeableConcept "BodySite"
* bodySite ^definition = "Primary anatomical site where the cancer condition was first detected."
* bodySite ^comment = "WG recommends ICD03, the WG will monitor possible next versions. It is required to choose the most specific code available, meaning the most detailed code in the hierarchical terminology that precisely identifies the body site."
* tumourGradeSystem 0..1 CodeableConcept "TumourGradeSystem"
* tumourGradeSystem ^definition = "Classification system used to define tumour grade, describing how abnormal tumour cells and tissue appear under microscopic examination (e.g. Gleason for prostate cancer, FNCLCC for soft tissue sarcomas). The grading system provides an indication of the biological aggressiveness of the tumour."
* tumourGradeSystem ^comment = "It represents the classification system used to define the tumour grade, such as Gleason (a grading system for prostate cancer) or FNCLCC (a grading system for soft tissue sarcomas)."
* tumourGradeValue 0..1 string "TumourGradeValue"
* tumourGradeValue ^definition = "Grade value assigned according to the selected TumourGradeSystem. The grade reflects the degree of cellular differentiation and biological aggressiveness of the tumour and may evolve over time."
* tumourGradeValue ^comment = "It represents the measured grade value based on the specific classification defined in the TumourGradeSystem."
* visitDate 0..1 dateTime "VisitDate"
* visitDate ^definition = "Date of the clinical visit that established the diagnosis (one of the diagnosis dates)."
* visitDate ^comment = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
* biopsyDate 0..1 dateTime "BiopsyDate"
* biopsyDate ^definition = "Date of the biopsy supporting the diagnosis (one of the diagnosis dates)."
* biopsyDate ^comment = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
* imagingDate 0..1 dateTime "ImagingDate"
* imagingDate ^definition = "Date of the diagnostic imaging supporting the diagnosis (one of the diagnosis dates)."
* imagingDate ^comment = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
* labReportDate 0..1 dateTime "LabReportDate"
* labReportDate ^definition = "Date of the laboratory report supporting the diagnosis, including biomarkers when applicable."
* labReportDate ^comment = "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."

Invariant: ccad-1
Description: "At least one of visitDate, biopsyDate, imagingDate, labReportDate must be present, since the model requires a diagnosis date for the Cancer Condition."
Severity: #error
Expression: "(visitDate | biopsyDate | imagingDate | labReportDate).exists()"