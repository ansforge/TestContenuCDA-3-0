<?xml version="1.0" encoding="UTF-8"?>
<!-- JDV_GroupeRhesus_OBP-SAP

    Contrôle du code des codes statiques des entrées de la section Active Problems de SAP
    Paramètres d'appel : Néant 
    Historique :
    25/10/2013 : GroupeRhesus20131025.sch
    25/10/2022 : Version 2022.01
    21/08/2023 : MAJ du schematron
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_GroupeRhesus_OBP-SAP" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_GroupeRhesus_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code='882-1']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   



