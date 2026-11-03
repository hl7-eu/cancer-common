Logical: Imaging
Id: Imaging
Title: "Imaging"
Description: "Logical model representing a diagnostic imaging procedure performed to define the diagnosis and the clinical stage. Derived from Cancer_Common_Logical_Model_20260521.xlsx (sheet Imaging)."
Characteristics: #can-be-target

* subject 1..1 CancerPatient "Subject"
* subject ^definition = "Reference to the patient (subject) on which the imaging was performed."
* type 1..1 CodeableConcept "Type"
* type ^definition = "Type of imaging procedure performed (e.g. thoracic MRI)."
* type ^comment = "It represents the type of imaging procedure performed (e.g. thoracic MRI)"
* bodySite 1..* CodeableConcept "BodySite"
* bodySite ^definition =  "Anatomical site(s) on which the imaging procedure was performed."
* bodySite ^comment = "It represents the body site on which the procedure was performed."
