<?xml version="1.0" encoding="UTF-8"?>
<!-- JDV_TranfertMutation_OBP-SAP

    Paramètres d'appel : Néant 
    Historique :
    25/10/2013 : OBP_TranfertMutation20131025.sch
    25/10/2022 : Version 2022.01
    21/08/2023 : Vesion 2023.01
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_TranfertMutation_OBP-SAP" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TranfertMutation_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation[cda:code/@code='107724000']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


