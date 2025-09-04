### R4 vs R5 IG

This implementation guide has parallel flavours for HL7 FHIR R4 and R5 versions. Content of the implementation guide versions is functionally the same. However, there are differences related to the available terminology for bindings or availability of extensions. Also, the corresponding HL7 Europe Base implementation guide and Extensions pack are provided both in R4 as well as R5 versions.

Mapping from EHDS logical models to R4 and R5 are provided on [Logical Models page](logicalmodels.html). The table format allows spotting differences between R4 and R5 versions.  

Most notable differences:  
- Addition of CodeableReference data type in R5.  
- RequestGroup resource in R4 has been renamed to RequestOrchestration in R5.  
- Differences in Medication resource element names.
- In profiles, some example value sets differ between versions due to the value set being only available for R4 (International Patient Summary) or only in R5 (IHE MPD extensions may use FHIR R5 core value sets).  

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}
