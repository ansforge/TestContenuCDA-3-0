<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Severite-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_ANEST-CR-CPA_Severite"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.29' and cda:code/@code='SEV']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern> 

