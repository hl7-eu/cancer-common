Logical: Imaging
Id: Imaging
Title: "Imaging"
Description: "Imaging logical model from Cancer_Common_Logical_Model_20260408.xlsx (sheet Imaging)."
Characteristics: #can-be-target

* type 1..1 CodeableConcept "Type"
* type ^definition = "Type of imaging procedure performed (e.g. thoracic MRI)."
* type ^comment = "It represents the type of imaging procedure performed (e.g. thoracic MRI)"
* bodySite 1..* CodeableConcept "BodySite"
* bodySite ^definition =  "Anatomical site(s) on which the imaging procedure was performed."
* bodySite ^definition = "It represents the body site on which the procedure was performed."
