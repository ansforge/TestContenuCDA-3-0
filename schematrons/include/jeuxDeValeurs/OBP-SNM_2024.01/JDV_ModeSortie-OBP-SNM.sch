<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_ModeSortie-OBP-SNM.sch :
    
    Historique :
        17/08/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ModeSortie-OBP-SNM" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_ModeSortie-OBP-SNM"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='ORG-074']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

