<?xml version="1.0" encoding="UTF-8"?>
<!-- JDV_ModeAccouchement_OBP-SAP

    Historique :
    
    21/08/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ModeAccouchemen_OBP-SAP" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ModeAccouchemen_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation[cda:code/@code='57071-3']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


