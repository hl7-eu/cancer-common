Instance: LastFollowUp3-Example
Title: "Last Follow-Up 3 Example"
Description: "Example follow-up with the patient alive and no evidence of disease on 2019-05-30."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Alive"
* evidenceOfDisease = false
* date = "2019-05-30"
