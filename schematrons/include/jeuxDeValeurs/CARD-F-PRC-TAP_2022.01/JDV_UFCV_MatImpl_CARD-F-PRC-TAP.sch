<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   JDV_UFCV_MatImpl_CARD-F-PRC-TAP.sch :
    Contenu :
    Contrôle des codes pour vérifier la présence d'endoprothèse
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        02/01/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UFCV_MatImpl_CARD-F-PRC-TAP" is-a="dansJeuDeValeurs">
    <p>Conformité CI-SIS du value du problème</p>
    <param name="path_jdv" value="$jdv_UFCV_MatImpl_CARD-F-PRC-TAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/code"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37' and cda:code/@code='282291009']//cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13' and cda:code/@code!='GEN-089' and cda:code/@code!='L0009']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

