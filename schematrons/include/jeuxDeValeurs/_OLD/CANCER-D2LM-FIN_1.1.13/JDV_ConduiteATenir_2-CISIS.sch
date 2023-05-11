<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ConduiteATenir_2-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ConduiteATenir_2-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation[cda:code[@code='GEN-007']/cda:qualifier[cda:name/@code='MED-121']/cda:value[@code='MED-015' or @code='MED-016' or @code='MED-017']]/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
