<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_ResultatDepistageSurdite_CISIS.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :        
       02/12/2024 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ResultatDepistageSurdite_CISIS" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_ResultatDepistageSurdite_CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/procedure/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:procedure[@negationInd='false' and cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.19' and cda:code/@code='MED-1304']/cda:entryRelationship/cda:observation[cda:code/@code='MED-1305']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern>