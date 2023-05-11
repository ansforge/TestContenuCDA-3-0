<?xml version="1.0" encoding="UTF-8"?>

<!--
 Historique :
        22/05/2017 : NMA : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UsageDrogues-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_UsageDrogues-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation[cda:code[@code='S-32200']]/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
