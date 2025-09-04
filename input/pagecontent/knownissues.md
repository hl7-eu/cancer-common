### Terminology bindings R4 vs R5  

All value set bindings declared in this implementation guide are with a binding strength 'example'. Normally, the preference is to not create new example value sets but use valid international value set definitions instead - for example, eHDSI EU crossborder services value sets for European scope, or International Patient Summary value sets for international use cases.  

Occasionally, a value set has been defined for R4 or R5 only, and the bindings in R4 and R5 profiles might therefore be slightly different. However, as they are only examples, this should not be a problem, as the content of example value sets should be relatively similar.  


### Ambiguous mappings for some elements  
#### Medicinal product name  

Medication resource does not have an explicit element for medicinal product's name. In countries where medication information is distributed as a code system, *de facto* element for holding the medication name has been Medication.code.text or Medication.code.coding.display. This is also the recommendations by HL7 Pharmacy.  

However, analysis of extensions in national implementation guides showed that many countries prefer to extend Medication resource in order to include an explicit element for the name. It is also evident, that countries often add multiple codings to the .code element, which makes it difficult to understand which of the codings display the official name of the product. Therefore, this IG includes a simple extension for the authorised medicinal product name. National implementations are not required to use the extension when their functional requirements are covered by .code element.  

#### Dispensing pharmacy  

In national implementations, two different approaches are used for capturing the details of the pharmacy where the dispense occurred:  
- MedicationDispense.location - pharmacy is indicated using Location resource.  
- MedicationDispense.performer.actor - PractitionerRole as performer is expected to indicate the pharmacy as an Organization.  

This implementation guide does not yet take a stance on which approach should be preferred. Additional input from countries is welcome during the ballots.  


#### Medication identifier vs code

In case of medications, the line between .identifier and .code is not always clear, and the habit of using the elements differs by countries.  
This implementation guide allows using .identifier element for non-instance identifiers like IDMP identifiers or product codes from a national product registry or EMA PLMS.  
