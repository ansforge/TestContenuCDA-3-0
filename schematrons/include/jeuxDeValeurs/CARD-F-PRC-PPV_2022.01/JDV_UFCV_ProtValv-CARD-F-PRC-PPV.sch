<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_UFCV_ProtValv-CARD-F-PRC-PPV.sch :
    Contenu :
    Contrôle du type de valve (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        06/01/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UFCV_ProtValv-CARD-F-PRC-PPV" is-a="dansJeuDeValeurs">
    <p>Conformité CI-SIS du type de valve</p>
    <param name="path_jdv" value="$jdv_UFCV_ProtValv-CARD-F-PRC-PPV"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/supply/participant/participantRole/playingDevice/code/translation[@code]"/>
    <param name="xpath_elt" value="cda:supply[cda:templateId/@root='1.2.250.1.213.1.1.3.20']/cda:participant/cda:participantRole/cda:playingDevice/cda:code/cda:translation[@code]"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

