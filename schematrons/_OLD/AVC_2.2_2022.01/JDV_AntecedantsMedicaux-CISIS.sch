<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    JDV_AntecedantsMedicaux-CISIS.sch :
    
    Historique :
        13/04/2022  : Création 
        -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_AntecedantsMedicaux-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_AntecedantsMedicaux-CISIS" />
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value" />
    <param name="xpath_elt" value="cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.134']/cda:entry/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.39']//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37']/cda:value"/>
<param name="nullFlavor" value="0"/>
    
</pattern> 