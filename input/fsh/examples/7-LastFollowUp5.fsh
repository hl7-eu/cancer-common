Instance: LastFollowUp5-Example
Title: "Last Follow-Up 5 Example"
Description: "Example follow-up with the patient alive and evidence of disease on 2020-01-02."
InstanceOf: LastFollowUp
Usage: #example

* subject = Reference(CancerPatient1-Example)
* vitalStatus.text = "Alive"
* evidenceOfDisease = true
* date = "2020-01-02"
