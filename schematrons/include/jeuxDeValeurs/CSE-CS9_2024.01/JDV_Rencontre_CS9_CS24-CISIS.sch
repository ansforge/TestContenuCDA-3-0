<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   JDV_Rencontre_CS9_CS24-CISIS.sch :
    Contenu :
    Contrôle des codes de la rencontre de la section FR-Plan-de-soins  (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/10/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Rencontre_CS9_CS24_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité de la rencontre</p>
    <param name="path_jdv" value="$JDV_Rencontre_CS9_CS24_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/encounter/code/qualifier/value'"/>
    <param name="xpath_elt" value="cda:encounter[cda:templateId/@root='1.2.250.1.213.1.1.3.58']/cda:code/cda:qualifier/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
