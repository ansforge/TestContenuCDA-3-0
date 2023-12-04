<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_ReperageTroubleNeurodeveloppement-CS9-CISIS.sch :
    Contenu :
    Contrôle de la valeur du repérage des troubles du neurodéveloppement de l'enfant  (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
       27/10/2023 : Renommage
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ReperageTroubleNeurodeveloppement_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité du repérage des troubles du neurodéveloppement de l'enfant</p>
    <param name="path_jdv" value="$JDV_ReperageTroubleNeurodeveloppement_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value'"/>
    <param name="xpath_elt" value="cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.161']/cda:entry/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' and cda:code/@code='MED-1274']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
