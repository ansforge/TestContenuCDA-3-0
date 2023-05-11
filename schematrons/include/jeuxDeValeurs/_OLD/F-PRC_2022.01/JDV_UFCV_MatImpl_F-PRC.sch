<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_UFCV_MatImpl_F-PRC.sch :
    Contenu :
    Contrôle du code du DM (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        07/02/2022 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UFCV_MatImpl_F-PRC" is-a="dansJeuDeValeurs">
    <p>Conformité CI-SIS du code du DM</p>
    <param name="path_jdv" value="$jdv_UFCV_MatImpl"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/supply/participant/participantRole/playingDevice/code"/>
    <param name="xpath_elt" value="cda:supply[cda:templateId/@root='1.2.250.1.213.1.1.3.20']/cda:participant/cda:participantRole/cda:playingDevice/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

