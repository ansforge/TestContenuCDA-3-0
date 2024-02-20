<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_FonctionEtudieeScintigraphie-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_FonctionEtudieeScintigraphie-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1' and cda:code/@code='NM']//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' and cda:code/@code='MED-1133']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern> 