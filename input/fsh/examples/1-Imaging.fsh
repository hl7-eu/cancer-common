Instance: Imaging1-Example
Title: "Imaging Example"
Description: "Example magnetic resonance imaging record for the lower lobe of the lung."
InstanceOf: Imaging
Usage: #example

* type.coding[0].system = "http://snomed.info/sct"
* type.coding[0].code = #113091000
* type.coding[0].display = "Magnetic resonance imaging"

* bodySite.coding[0].system = "http://terminology.hl7.org/CodeSystem/icd-o-3"
* bodySite.coding[0].code = #C34.3
* bodySite.coding[0].display = "Lower lobe, lung"
