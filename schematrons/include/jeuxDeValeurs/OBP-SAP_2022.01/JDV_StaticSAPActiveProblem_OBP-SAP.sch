<?xml version="1.0" encoding="UTF-8"?>
<!-- JDV_StaticSAPActiveProblem_OBP-SAP

    Contrôle du code des codes statiques des entrées de la section Active Problems de SAP
    Paramètres d'appel : Néant 
    Historique :
    25/10/2013 : OBP_StaticSAPActiveProbleml20131025.sch
    25/10/2022 : Version 2022.01
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_StaticSAPActiveProblem_OBP-SAP" is-a="dansJeuDeValeurs">
    <p>Conformité des demandes d'examen complémentaires</p>
    <param name="path_jdv" value="$JDV_StaticSAPActiveProblem_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.6']/cda:entry/cda:act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

