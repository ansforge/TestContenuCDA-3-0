<?xml version="1.0" encoding="UTF-8"?>
<!-- 
     JDV_ComplicationUrinaire-CISIS.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        23/05/2023 : CRI : Création
      
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ComplicationUrinaire-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ComplicationUrinaire-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='MED-520']/cda:entryRelationship/cda:observation/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>   

