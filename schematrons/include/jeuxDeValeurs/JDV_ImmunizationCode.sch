<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_immunizationCode.sch :
    Contenu :
        Contrôle du code du JDV utilisé dans l'entrée FR-Vaccination 
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        14/12/2022 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="immunizationCode" is-a="abstractImmunization">
    <p>Conformité du type de document au CI-SIS</p>
    <param name="path_jdv1" value="$jdv_immunization_1"/>
    <param name="path_jdv2" value="$jdv_immunization_2"/>
    <param name="vue_elt" value="'//substanceAdministration/code'"/>
    <param name="xpath_elt" value="//cda:substanceAdministration[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
