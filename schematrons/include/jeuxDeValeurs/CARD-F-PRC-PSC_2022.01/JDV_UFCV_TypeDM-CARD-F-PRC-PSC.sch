<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   JDV_UFCV_TypeDM-CARD-F-PRC-PSC.sch :
    Contenu :
    Contrôle du type PM (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        07/02/2022 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UFCV_TypeDM-CARD-F-PRC-PSC" is-a="dansJeuDeValeurs">
    <p>Conformité CI-SIS du type PM</p>
    <param name="path_jdv" value="$jdv_UFCV_TypeDM-CARD-F-PRC-PSC"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/supply/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:supply[cda:templateId/@root='1.2.250.1.213.1.1.3.20' and cda:participant/cda:participantRole/cda:playingDevice/cda:code[@code='D0001-2']]//cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13' and cda:code/@code='L0036']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

