Logical: SystemicTreatment
Id: SystemicTreatment
Title: "SystemicTreatment"
Description: "Logical model representing a systemic anti-cancer treatment episode delivered to the patient, either at diagnosis or following disease progression. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet SystemicTreatment)."
Characteristics: #can-be-target

* obeys st-1
* obeys st-2
* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) receiving systemic treatment."
* cancerConditionAtDiagnosisReference 1..1 CancerConditionAtDiagnosis "CancerConditionAtDiagnosisReference"
* cancerConditionAtDiagnosisReference ^definition = "Reference to the cancer condition at diagnosis targeted by systemic treatment."
* clinicalCancerProgressionReference 0..1 ClinicalCancerProgression "ClinicalCancerProgresionReference"
* clinicalCancerProgressionReference ^definition = "Reference to the clinical progression event, if treatment is delivered in response to progression."
* clinicalCancerProgressionReference ^comment = "It is not only required at the time of diagnosis; it must be provided in the event of ClinicalCancerProgression."
* intent 1..1 CodeableConcept "Intent"
* intent ^definition = "Treatment intent (Definitive/curative vs Palliative)."
* intent ^comment = "Choice: Definitive | Palliative"
* type 1..1 CodeableConcept "Type"
* type ^definition = "Category of systemic treatment (e.g. chemotherapy, immunotherapy, targeted therapy, hormonal therapy)."
* startDate 1..1 dateTime "StartDate"
* startDate ^definition = "Start date of the systemic treatment course."
* endDate 0..1 dateTime "EndDate"
* endDate ^definition = "End date of the systemic treatment course (may be missing while ongoing)."
* endDate ^comment = "It might not be available while the treatment is still ongoing; however, an end date must eventually be recorded, which in the most extreme case will coincide with the patient's date of death."
* ongoing 0..1 boolean "Ongoing"
* ongoing ^definition = "Indicates that the treatment is ongoing when EndDate is not available."
* ongoing ^comment = "If the EndDate is not provided because it is ongoing, it must be indicates as True."
* setting 0..1 CodeableConcept "Setting"
* setting ^definition = "Strategic timing/setting of systemic treatment (e.g. neoadjuvant, adjuvant, concomitant, alone)."
* setting ^comment = "Choice: Alone |  Preoperative/Neoadjuvant | Postoperative/Adjuvant | Concomitant"

Invariant: st-1
Description: "If ongoing is true, endDate must not be present; if endDate is not present, ongoing must be true."
Severity: #error
Expression: "((ongoing = true) implies endDate.empty()) and (endDate.exists() implies (ongoing.exists().not() or ongoing = false))"
Invariant: st-2
Description: "If endDate is present, it should be greater than or equal to startDate."
Severity: #warning
Expression: "endDate.empty() or endDate > startDate"