Instance: LastFollowUp4-Example
Title: "Last Follow-Up 4 Example"
Description: "Example follow-up with the patient alive and evidence of disease on 2019-08-31."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Alive"
* evidenceOfDisease = true
* date = "2019-08-31"
