<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_OBP_Result-Evenement-CISIS.sch :
   
    Historique :
        20/06/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_OBP_Result-Evenement" is-a="dansJeuDeValeurs">
    <p>Result-Evenement</p>
    <param name="path_jdv" value="$jdv_OBP_Result-Evenement"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:code/@code='42545-4']/cda:entry/cda:observation/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
