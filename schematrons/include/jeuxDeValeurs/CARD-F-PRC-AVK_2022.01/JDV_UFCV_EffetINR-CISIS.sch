<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   JDV_UFCV_EffetINR-CISIS.sch :
    Contenu :
    Contrôle des effets INR : Médicaments augmentant l’INR 
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        03/01/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_UFCV_EffetINR-CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité CI-SIS du Stade NYHA dans l'élément value</p>
    <param name="path_jdv" value="$jdv_UFCV_EffetINR-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.41' and cda:code/@code='DNAINT']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

