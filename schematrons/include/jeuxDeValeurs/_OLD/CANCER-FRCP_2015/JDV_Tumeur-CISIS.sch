<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_Tumeur-CISIS.sch

    Paramètres d'appel :
        Néant 
    Historique :
        27/06/2011 : CRI ASIP/PRAS : Création
        14/10/2019 : Mise à jour du nom du schématron, de l'id et de la variable
        22/02/2021 : Renommage
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Tumeur-CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité du diagnostic</p>
    <param name="path_jdv" value="$JDV_Tumeur-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section[templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.3.14.1']/entry/act/entryRelationship/observation[value/@code='RCP_075']/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.3.14.1']/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='RCP_075']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern>   

