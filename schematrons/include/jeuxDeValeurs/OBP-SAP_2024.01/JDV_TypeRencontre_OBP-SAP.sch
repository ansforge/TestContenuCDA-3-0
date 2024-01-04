<?xml version="1.0" encoding="UTF-8"?>
<!-- JDV_TypeRencontre_OBP-SAP

    Historique :
    
    21/08/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_TypeRencontre_OBP-SAP" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TypeRencontre_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/encounter/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:encounter[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.14']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


