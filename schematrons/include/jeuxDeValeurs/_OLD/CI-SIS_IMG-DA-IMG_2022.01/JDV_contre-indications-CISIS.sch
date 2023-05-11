<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_contre-indications-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_contre-indications-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.150' and cda:code/@code='64100-1']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern> 