Logical: Imaging
Id: Imaging
Title: "Imaging"
Description: "Imaging logical model from Cancer_Common_Logical_Model_20260123_2.xlsx (sheet Imaging)."
Characteristics: #can-be-target

* type 1..1 CodeableConcept "Type"
* type ^definition = "It represents the type of imaging procedure performed (e.g. thoracic MRI) nan"
* bodySite 1..* CodeableConcept "BodySite"
* bodySite ^definition = "It represents the body site on which the procedure was performed. nan"
