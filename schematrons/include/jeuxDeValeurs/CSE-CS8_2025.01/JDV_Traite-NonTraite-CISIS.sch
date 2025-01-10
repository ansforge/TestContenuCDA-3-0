<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_condition-ver-status-CISIS.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        06/04/2022 : ANS Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Traite-NonTraite-CISIS" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_Traite-NonTraite-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.53' and cda:code/@code='O13']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>


