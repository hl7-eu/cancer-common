Instance: LastFollowUp1-Example
Title: "Last Follow-Up 1 Example"
Description: "Example follow-up with the patient alive and no evidence of disease on 2018-10-30."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Alive"
* evidenceOfDisease = false
* date = "2018-10-30"
