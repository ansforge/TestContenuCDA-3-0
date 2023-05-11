<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_TypeInfectionNN_OBP-SCE.sch
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
        04/11/2022 : Mises à jour suite à la migration
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_TypeInfectionNN_OBP-SCE" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$jdv_TypeInfectionNN_OBP-SCE"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:value[cda:qualifier/cda:value/@code='Z22.9']"/>
    <param name="nullFlavor" value="0"/>
</pattern>   



