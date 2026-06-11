Instance: LastFollowUp7-Example
Title: "Last Follow-Up 7 Example"
Description: "Example final follow-up documenting death from malignant neoplasm of bronchus and lung."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Dead"
* causeOfDeath.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* causeOfDeath.coding[0].code = #C34
* causeOfDeath.coding[0].display = "Malignant neoplasm of bronchus and lung"
* date = "2020-06-28"
* deathDate = "2020-06-28"
