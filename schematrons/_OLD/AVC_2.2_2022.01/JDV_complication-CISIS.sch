<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_complication-CISIS.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        12/04/2023 : ANS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_complication-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_complication-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.163']/cda:entry/cda:observation/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>   


