Instance: LastFollowUp6-Example
Title: "Last Follow-Up 6 Example"
Description: "Example follow-up with the patient alive and evidence of disease on 2020-04-15."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Alive"
* evidenceOfDisease = true
* date = "2020-04-15"
