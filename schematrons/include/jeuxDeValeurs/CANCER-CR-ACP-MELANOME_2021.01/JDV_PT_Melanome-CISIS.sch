<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_PT_Melanome-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_PT_Melanome-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.138' and cda:code/@code='MED-830']/cda:value|
                                   cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.135' and cda:code/@code='MED-834']/cda:value|
                                   cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.137' and cda:code/@code='MED-835']/cda:value|
                                   cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.162' and cda:code/@code='MED-836']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern> 
