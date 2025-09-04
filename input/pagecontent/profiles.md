### Mappings from EHDS models to FHIR profiles

EHDS logical information models are provided by Xt-EHR project. Please read more about the models on [Logical Models page](logicalmodels.html).  
Mappings from eHealth Network Guidelines are not provided by this guide.

#### Prescription  

EHDS Medication Prescription model allows multiple items prescribed on one prescription. In such case, EHDS.MedicationPrescription.identifier maps to MedicationRequest.groupIdentifier, and RequestOrchestration/RequestGroup may be the target of some of the prescription elements. Please read [implementation notes](implementationnotes.html) for more information.  
  
|**Logical model element**|**FHIR Path R5**|**FHIR Path R4**|  
|EHDSMedicationPrescription.header.identifier|MedicationRequest.identifier or .groupIdentifier|MedicationRequest.identifier or .groupIdentifier|  
|EHDSMedicationPrescription.header.authorship.author|MedicationRequest.requester|MedicationRequest.requester|  
|EHDSMedicationPrescription.header.authorship.datetime|MedicationRequest.authoredOn|MedicationRequest.authoredOn|  
|EHDSMedicationPrescription.header.subject|MedicationRequest.subject|MedicationRequest.subject|  
|EHDSMedicationPrescription.header.validFrom|MedicationRequest.dispenseRequest.validityPeriod.start|MedicationRequest.dispenseRequest.validityPeriod.start|  
|EHDSMedicationPrescription.header.validUntil|MedicationRequest.dispenseRequest.validityPeriod.end|MedicationRequest.dispenseRequest.validityPeriod.end|  
|EHDSMedicationPrescription.header.recorder|MedicationRequest.recorder|MedicationRequest.recorder|  
|EHDSMedicationPrescription.header.recordingDate|MedicationRequest.eventhistory.recorded|MedicationRequest.eventhistory.recorded|  
|EHDSMedicationPrescription.header.status|MedicationRequest.status or RequestOrchestration.status (for multi-item)|MedicationRequest.status or RequestGroup.status (for multi-item)|  
|EHDSMedicationPrescription.header.statusReason[x]|MedicationRequest.statusReason|MedicationRequest.statusReason|   
|EHDSMedicationPrescription.comment|MedicationRequest.note.text, RequestOrchestration.note.text|MedicationRequest.note.text, RequestGroup.note.text|  
|EHDSMedicationPrescription.prescriptionItem|MedicationRequest|MedicationRequest|  
|EHDSMedicationPrescription.prescriptionItem.identifier|MedicationRequest.identifier|MedicationRequest.identifier|  
|EHDSMedicationPrescription.prescriptionItem.category|MedicationRequest.category|MedicationRequest.category|  
|EHDSMedicationPrescription.prescriptionItem.status|MedicationRequest.status|MedicationRequest.status|  
|EHDSMedicationPrescription.prescriptionItem.statusReason[x]|MedicationRequest.statusReason|MedicationRequest.statusReason|  
|EHDSMedicationPrescription.prescriptionItem.medication|MedicationRequest.medication|MedicationRequest.medication[x]|  
|EHDSMedicationPrescription.prescriptionItem.indication[x]|MedicationRequest.reason|MedicationRequest.reasonCode or .reasonReference|  
|EHDSMedicationPrescription.prescriptionItem.indicationText|MedicationRequest.reason.concept.text|MedicationRequest.reasonCode.text|  
|EHDSMedicationPrescription.prescriptionItem.prescriptionIntent|MedicationRequest.reason|MedicationRequest.reason|  
|EHDSMedicationPrescription.prescriptionItem.treatmentPeriod|MedicationRequest.effectiveDosePeriod|MedicationRequest.extension:effectiveDosePeriod|  
|EHDSMedicationPrescription.prescriptionItem.quantityPrescribed|MedicationRequest.dispenseRequest.extension: prescribedQuantity|MedicationRequest.dispenseRequest.extension: prescribedQuantity|  
|EHDSMedicationPrescription.prescriptionItem.dosageInstructions|MedicationRequest.dosageInstruction|MedicationRequest.dosageInstruction|  
|EHDSMedicationPrescription.prescriptionItem.preparationInstructions|MedicationRequest.dispenseRequest.dispenserInstruction||  
|EHDSMedicationPrescription.prescriptionItem.substitution|MedicationRequest.substitution|MedicationRequest.substitution|  
|EHDSMedicationPrescription.prescriptionItem.substitution.allowed[x]|MedicationRequest.substitution.allowed[x]|MedicationRequest.substitution.allowed[x]|  
|EHDSMedicationPrescription.prescriptionItem.substitution.reason[x]|MedicationRequest.substitution.reason|MedicationRequest.substitution.reason|  
|EHDSMedicationPrescription.prescriptionItem.repeatsAllowed|MedicationRequest.dispenseRequest.numberOfRepeatsAllowed|MedicationRequest.dispenseRequest.numberOfRepeatsAllowed|  
|EHDSMedicationPrescription.prescriptionItem.minimumDispenseInterval|MedicationRequest.dispenseRequest.dispenseInterval|MedicationRequest.dispenseRequest.dispenseInterval|  
|EHDSMedicationPrescription.prescriptionItem.offLabel|MedicationRequest.extension:offLabelUse|MedicationRequest.extension:offLabelUse|  
|EHDSMedicationPrescription.prescriptionItem.comment|MedicationRequest.note.text|MedicationRequest.note.text|  
{:.table-bordered .table-striped .thead-light}

#### Medication  
  
|**Logical model element**|**FHIR Path R5**|**FHIR Path R4**|  
|EHDSMedication.identifyingCode[x]|Medication.code OR Medication.identifier|Medication.code OR Medication.identifier|  
|EHDSMedication.classification|Medication.extension:classification|Medication.extension:classification|  
|EHDSMedication.productName|Medication.extension:productName|Medication.extension:productName|  
|EHDSMedication.marketingAuthorisationHolder|Medication.marketingAuthorizationHolder|Medication.manufacturer|  
|EHDSMedication.doseForm|Medication.doseForm|Medication.form|  
|EHDSMedication.packSize|Medication.totalVolume|Medication.amount|  
|EHDSMedication.item|Medication.ingredient.item.reference(Medication)|Medication.ingredient.itemReference(Medication)|  
|EHDSMedication.item.doseForm|Medication.doseForm|Medication.form|  
|EHDSMedication.item.ingredient|||  
|EHDSMedication.item.ingredient.isActive|Medication.ingredient.isActive|Medication.ingredient.isActive|  
|EHDSMedication.item.ingredient.substance|Medication.ingredient.item|Medication.ingredient.itemCodeableConcept|  
|EHDSMedication.item.ingredient.strengthInfo|Medication.ingredient.strength[x]|Medication.ingredient.strength|  
|EHDSMedication.item.ingredient.strengthInfo.strength|Medication.ingredient.strengthRatio|Medication.ingredient.strengthRatio|  
|EHDSMedication.item.ingredient.strengthInfo.basisOfStrengthSubstance|Medication.ingredient.strength[x].extension:basisOfStrengthSubstance|Medication.ingredient.strength[x].extension:basisOfStrengthSubstance|  
|EHDSMedication.item.unitOfPresentation|Medication.extension:unitOfPresentation|Medication.extension:unitOfPresentation|  
|EHDSMedication.item.containedQuantity|Medication.extension:sizeOfItem|Medication.extension:sizeOfItem|  
|EHDSMedication.item.amount|Medication.totalVolume|Medication.amount|  
|EHDSMedication.item.packageType|Medication.extension:packageType|Medication.extension:packageType|  
|EHDSMedication.device|Medication.extension:device|Medication.extension:device|  
|EHDSMedication.characteristic|Medication.extension:characteristic|Medication.extension:characteristic|  
|EHDSMedication.batch|Medication.batch|Medication.batch|  
|EHDSMedication.batch.lotNumber|Medication.batch.lotNumber|Medication.batch.lotNumber|  
|EHDSMedication.batch.expirationDate|Medication.batch.expirationDate|Medication.batch.expirationDate|  
{:.table-bordered .table-striped .thead-light}

#### Dosaging  
  
|**Logical model element**|**FHIR Path R5**|**FHIR Path R4**|  
|EHDSDosaging.sequence|Dosage.sequence|Dosage.sequence|  
|EHDSDosaging.text|Dosage.text|Dosage.text|  
|EHDSDosaging.additionalInstruction|Dosage.additionalInstruction|Dosage.additionalInstruction|  
|EHDSDosaging.patientInstruction|patientInstruction|patientInstruction|  
|EHDSDosaging.doseAndRate|Dosage.doseAndRate|Dosage.doseAndRate|  
|EHDSDosaging.doseAndRate.type|Dosage.doseAndRate.type|Dosage.doseAndRate.type|  
|EHDSDosaging.doseAndRate.dose[x]|Dosage.doseAndRate.dose[x]|Dosage.doseAndRate.dose[x]|  
|EHDSDosaging.doseAndRate.rate[x]|Dosage.doseAndRate.rate[x]|Dosage.doseAndRate.rate[x]|  
|EHDSDosaging.timing|Dosage.timing|Dosage.timing|  
|EHDSDosaging.timing.event|Dosage.timing.event|Dosage.timing.event|  
|EHDSDosaging.timing.code|Dosage.timing.code|Dosage.timing.code|  
|EHDSDosaging.timing.repeat|Dosage.timing.repeat|Dosage.timing.repeat|  
|EHDSDosaging.timing.repeat.bounds|Dosage.timing.repeat.bounds[x]|Dosage.timing.repeat.bounds[x]|   
|EHDSDosaging.timing.repeat.bounds.duration|Dosage.timing.repeat.boundsQuantity|Dosage.timing.repeat.boundsDuration|  
|EHDSDosaging.timing.repeat.bounds.range|Dosage.timing.repeat.boundsRange|Dosage.timing.repeat.boundsRange|  
|EHDSDosaging.timing.repeat.bounds.period|Dosage.timing.repeat.boundsPeriod|Dosage.timing.repeat.boundsPeriod|  
|EHDSDosaging.timing.repeat.count|||  
|EHDSDosaging.timing.repeat.count.count|Dosage.timing.repeat.count|Dosage.timing.repeat.count|  
|EHDSDosaging.timing.repeat.count.countMax|Dosage.timing.repeat.countMax|Dosage.timing.repeat.countMax|  
|EHDSDosaging.timing.repeat.duration|||  
|EHDSDosaging.timing.repeat.duration.duration|Dosage.timing.repeat.duration + Dosage.timing.repeat.durationUnit|Dosage.timing.repeat.duration + Dosage.timing.repeat.durationUnit|  
|EHDSDosaging.timing.repeat.duration.durationMax|Dosage.timing.repeat.durationMax|Dosage.timing.repeat.durationMax  + Dosage.timing.repeat.durationUnit|  
|EHDSDosaging.timing.repeat.frequency|||  
|EHDSDosaging.timing.repeat.frequency.numberOfTimes|Dosage.timing.repeat.frequency|Dosage.timing.repeat.frequency|  
|EHDSDosaging.timing.repeat.frequency.maxNumberOfTimes|Dosage.timing.repeat.frequencyMax|Dosage.timing.repeat.frequencyMax|  
|EHDSDosaging.timing.repeat.frequency.period|Dosage.timing.repeat.period + Dosage.timing.repeat.periodUnit|Dosage.timing.repeat.period + Dosage.timing.repeat.periodUnit|  
|EHDSDosaging.timing.repeat.frequency.periodMax|Dosage.timing.repeat.periodMax + Dosage.timing.repeat.periodUnit|Dosage.timing.repeat.periodMax + Dosage.timing.repeat.periodUnit|  
|EHDSDosaging.timing.repeat.dayOfWeek|Dosage.timing.repeat.dayOfWeek|Dosage.timing.repeat.dayOfWeek|  
|EHDSDosaging.timing.repeat.timeOfDay|Dosage.timing.repeat.timeOfDay|Dosage.timing.repeat.timeOfDay|  
|EHDSDosaging.timing.repeat.eventTime|||  
|EHDSDosaging.timing.repeat.eventTime.when|Dosage.timing.repeat.when|Dosage.timing.repeat.when|  
|EHDSDosaging.timing.repeat.eventTime.offset|Dosage.timing.repeat.offset|Dosage.timing.repeat.offset|  
|EHDSDosaging.asNeeded|Dosage.asNeeded|Dosage.asNeededBoolean|  
|EHDSDosaging.asNeededFor|Dosage.asNeededFor|Dosage.asNeededCodeableConcept|  
|EHDSDosaging.bodySite|Dosage.site|Dosage.site|  
|EHDSDosaging.routeOfAdministration|Dosage.route|Dosage.route|  
|EHDSDosaging.methodOfAdministration|Dosage.method|Dosage.method|  
|EHDSDosaging.maxDose|||  
|EHDSDosaging.maxDose.maxDosePerPeriod|Dosage.maxDosePerPeriod|Dosage.maxDosePerPeriod|  
|EHDSDosaging.maxDose.maxDosePerAdministration|Dosage.maxDosePerAdministration|Dosage.maxDosePerAdministration|  
|EHDSDosaging.maxDose.maxDosePerLifetime|Dosage.maxDosePerLifetime|Dosage.maxDosePerLifetime|   
{:.table-bordered .table-striped .thead-light}

#### Medication Dispense  
  
|**Logical model element**|**FHIR Path R5**|**FHIR Path R4**|  
|EHDSMedicationDispense.header.identifier|MedicationDispense.identifier|MedicationDispense.identifier|  
|EHDSMedicationDispense.header.status|MedicationDispense.status|MedicationDispense.status|  
|EHDSMedicationDispense.header.statusReason[x]|MedicationDispense.notPerformedReason|MedicationDispense.statusReason|  
|EHDSMedicationDispense.header.subject|MedicationDispense.subject|MedicationDispense.subject|  
|EHDSMedicationDispense.header.authorship.author|MedicationDispense.performer.actor|MedicationDispense.performer.actor|  
|EHDSMedicationDispense.header.authorship.datetime|MedicationDispense.whenHandedOver or .recorded|MedicationDispense.whenHandedOver|
|EHDSMedicationDispense.receiver[x]|MedicationDispense.receiver|MedicationDispense.receiver|  
|EHDSMedicationDispense.dispenseLocation|MedicationDispense.location|MedicationDispense.location|  
|EHDSMedicationDispense.relatedRequest|MedicationDispense.authorizingPrescription|MedicationDispense.authorizingPrescription|  
|EHDSMedicationDispense.medication|MedicationDispense.medication|MedicationDispense.medication[x]|  
|EHDSMedicationDispense.dispensedQuantity|MedicationDispense.quantity|MedicationDispense.quantity|  
|EHDSMedicationDispense.timeOfDispensation|MedicationDispense.whenHandedOver|MedicationDispense.whenHandedOver|  
|EHDSMedicationDispense.substitution|MedicationDispense.substitution|MedicationDispense.substitution|  
|EHDSMedicationDispense.substitution.substitutionOccurred|MedicationDispense.substitution.wasSubstituted|MedicationDispense.substitution.wasSubstituted|  
|EHDSMedicationDispense.substitution.substitutionType|MedicationDispense.substitution.type|MedicationDispense.substitution.type|  
|EHDSMedicationDispense.substitution.substitutionReason|MedicationDispense.substitution.reason|MedicationDispense.substitution.reason|  
|EHDSMedicationDispense.dosageInstructions|MedicationDispense.dosageInstruction|MedicationDispense.dosageInstruction|  
|EHDSMedicationDispense.comment|MedicationDispense.note|MedicationDispense.note|   
{:.table-bordered .table-striped .thead-light}

#### Dispense Decline  

|**Logical model element**|**FHIR Path R5**|**FHIR Path R4**|  
|EHDSDispenseDecline.header.identifier|MedicationDispense.identifier|MedicationDispense.identifier|  
|EHDSDispenseDecline.header.subject|MedicationDispense.subject|MedicationDispense.subject|  
|EHDSDispenseDecline.header.status|MedicationDispense.status|MedicationDispense.status|  
|EHDSDispenseDecline.header.statusReason[x]|MedicationDispense.notPerformedReason|MedicationDispense.statusReason|  
|EHDSDispenseDecline.header.authorship.author|MedicationDispense.performer.actor|MedicationDispense.performer.actor|  
|EHDSDispenseDecline.header.authorship.datetime|MedicationDispense.whenHandedOver or .recorded|MedicationDispense.whenHandedOver|  
|EHDSDispenseDecline.relatedRequest|MedicationDispense.authorizingPrescription|MedicationDispense.authorizingPrescription|  
|EHDSDispenseDecline.comment|MedicationDispense.note|MedicationDispense.note|   
{:.table-bordered .table-striped .thead-light}