<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Diagnostic_Etat_Ganglions_Melanome_CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_Diagnostic_Etat_Ganglions_Melanome_CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
    <param name="xpath_elt" value="
        cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.3.1']/
        cda:entry/cda:organizer/cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.8.1.4.9' 
        and cda:code/@code='MED-866']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern> 


