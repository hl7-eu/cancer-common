### Logical information models

Logical data models or information models for EHDS are created by Xt-EHR project. These models are refined and enhanced versions of the [eHN Guidelines data sets](https://health.ec.europa.eu/system/files/2022-06/ehealth_health-data_electronic-exchange_eprescriptions-guidelines_en.pdf) published in 2022.

This IG aims to conform to EHDS logical models, and provide the FHIR profiles based on these models. 

EHDS draft logical models for eP and eD use case can be seen in [**Xt-EHR Implementation Guide**](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCasePrescription.html). The key models for this implementation guide are: 
- [Medication Prescription Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedicationPrescription.html)   
- [Medication Dispense Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedicationDispense.html)  
- [Dispense Decline Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSDispenseDecline.html)  

- [Medication Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedication.html)  
- [Dosaging Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSDosaging.html)

### eHN Guideline Data Sets

[The Artifacts page](artifacts.html) also provides eHN data sets as logical models. However, those data sets have not been originally published as machine-readable models and the derived logical models often lack of precision and concreteness. EHDS logical information models (see above) use eHN data sets as a conceptual base, and provide non-ambiguous machine-readable models.


