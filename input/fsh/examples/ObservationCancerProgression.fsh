Instance: ObservationClinicalCancerProgression1-Example
InstanceOf: observation-clinical-cancer-progression-eu-ccm
Usage: #example
Description: "Example of describing the cancer progression."

* status = #final
* code = $loinc#97509-4 "Cancer disease progression" 

* focus = Reference(ConditionAtDiagnosis1-Example)

* valueCodeableConcept = $sct#263853000 "Recurrent episode (qualifier value)"

* component.code = $sct#277457005 "Histological grading systems (staging scale)"

* component.valueString = "G2"

* effectiveDateTime = "2019-08-31"

* extension[ExtentType].valueCodeableConcept = $sct#14799000 "Neoplasm, metastatic (morphologic abnormality)"

* extension[MetastaticSites].valueCodeableConcept = $icd03#C77.1 "Intrathoracic lymph nodes"








Instance: ObservationClinicalCancerProgression2-Example
InstanceOf: observation-clinical-cancer-progression-eu-ccm
Usage: #example
Description: "Example of describing the cancer progression."

* status = #final
* code = $loinc#97509-4 "Cancer disease progression" 

* focus = Reference(ConditionAtDiagnosis1-Example)

* valueCodeableConcept = $sct#263853000 "Recurrent episode (qualifier value)"

* component.code = $sct#277457005 "Histological grading systems (staging scale)"

* component.valueString = "G1"

* effectiveDateTime = "2019-11-30"

* extension[ExtentType].valueCodeableConcept = $sct#410674003 "Regional (qualifier value)"

* extension[LocoRegionalSites].valueCodeableConcept = $icd03#C77.1 "Intrathoracic lymph nodes"