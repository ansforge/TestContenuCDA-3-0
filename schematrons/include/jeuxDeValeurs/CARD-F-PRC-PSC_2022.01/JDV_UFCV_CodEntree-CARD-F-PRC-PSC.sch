<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   JDV_UFCV_CodEntree-CARD-F-PRC-PSC.sch :
    Contenu :
    Contrôle du code d'entrée(nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        05/01/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UFCV_CodEntree-CARD-F-PRC-PSC" is-a="dansJeuDeValeurs">
    <p>Conformité CI-SIS du code d'entrée</p>
    <param name="path_jdv" value="$jdv_UFCV_CodEntree-CARD-F-PRC-PSC"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/supply/entryRelationship/observation/code"/>
    <param name="xpath_elt" value="cda:supply[cda:templateId/@root='1.2.250.1.213.1.1.3.20']//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' or cda:templateId/@root='1.2.250.1.213.1.1.3.1']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

