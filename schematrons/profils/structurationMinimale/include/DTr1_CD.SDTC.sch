<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CD.EPSOS - Concept Descriptor
    Status: draft
    TODO: check for codes/codesystems in translations
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="CD.SDTC">
   <extends rule="CD"/>
   <assert role="error" test="descendant-or-self::*[not(@code) or @displayName]" see="https://docs.art-decor.org/documentation/datatypes/DTr1_CD.SDTC">dtr1-1-CD.SDTC: attribute @displayName is required on all codes and translations thereof</assert>
</rule>