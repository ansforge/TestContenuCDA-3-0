<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_StatutDoc-CISIS.sch :
    Contenu :
    Contrôle du code du niveau diagnostique d'une entrée Problem Entry (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
        14/10/19 : NMA : Mise à jour du nom du schématron, de l'id et de la variable
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_StatutDoc-CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité du statut du document</p>
    <param name="path_jdv" value="$JDV_StatutDoc-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.35']/cda:entry/cda:observation[cda:code/@code='CDA_001']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern>   

