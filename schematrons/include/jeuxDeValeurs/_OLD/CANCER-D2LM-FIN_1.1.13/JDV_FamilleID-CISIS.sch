<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_FamilleID-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_FamilleID-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code='MED-123']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
