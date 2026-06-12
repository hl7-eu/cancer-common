Instance: LastFollowUp2-Example
Title: "Last Follow-Up 2 Example"
Description: "Example follow-up with the patient alive and no evidence of disease on 2019-02-28."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Alive"
* evidenceOfDisease = false
* date = "2019-02-28"
