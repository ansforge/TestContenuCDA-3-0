<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_ExamenHematologieAUNV-CISIS.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        17/01/18 : NMA : Prise en compte du NullFlavor dans le JDV
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ExamenHematologieAUNV-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ExamenHematologieAUNV-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/organizer/component/observation/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act[cda:code/@code='18723-7']/cda:entryRelationship/cda:organizer/cda:component/cda:observation/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>   
