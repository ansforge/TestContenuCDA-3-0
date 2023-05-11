<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_PM_Melanome-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_PM_Melanome-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.27' and cda:code/@code='MED-832']/cda:value|
        cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.32' and cda:code/@code='MED-833']/cda:value|
        cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.31' and cda:code/@code='MED-840']/cda:value|
        cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.162' and cda:code/@code='MED-841']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>

