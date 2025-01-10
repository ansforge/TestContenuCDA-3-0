<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_AntecedentsObstetricaux_CSE.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        08/03/2018 : Création
        23/03/2021 : Renommage
        06/04/2022 : Modification de xpath_elt
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_AntecedentsObstetricaux-CISIS" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_AntecedentsObstetricaux-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/code"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>