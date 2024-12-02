<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_AntecedentsCSE9_CISIS.sch :
    Contenu :
    Contrôle de la valeur des antécédents d'un enfant (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/10/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_AntecedentsCSE24-CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité des antécèdents</p>
    <param name="path_jdv" value="$JDV_AntecedentsCSE24-CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value'"/>
    <param name="xpath_elt" value="cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.39']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37' and cda:code/@code='282291009']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
