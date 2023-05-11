<?xml version="1.0" encoding="UTF-8"?>
<!-- JDV_TrimestreGrossesse_OBP-SAP
   
    Paramètres d'appel : Néant 
    Historique :
    25/10/2013 : OBP_TrimestreGrossesse20131025.sch
    25/10/2022 : Version 2022.01
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_TrimestreGrossesse_OBP-SAP" is-a="dansJeuDeValeurs">
    <p>Conformité des demandes d'examen complémentaires</p>
    <param name="path_jdv" value="$JDV_TrimestreGrossesse_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/value/qualifier/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation/cda:entryRelationship/cda:observation/cda:value/cda:qualifier[cda:name/@code='32418-6']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern>   