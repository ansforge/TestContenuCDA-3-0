<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_ModeSortie_OBP-SCM.sch
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
        03/11/2022 : ANS : Mises à jour suite à la migration
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ModeSortie_OBP-SCM" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$jdv_ModeSortie_OBP-SCM"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='ORG-074']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   



