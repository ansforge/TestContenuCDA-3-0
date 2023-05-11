<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ImagerieObjectifsReference-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ImagerieObjectifsReference-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/act/entryRelationship/act/entryRelationship/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.840.10008.9.18']//cda:observation[cda:code/@code='ASSERTION']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern> 