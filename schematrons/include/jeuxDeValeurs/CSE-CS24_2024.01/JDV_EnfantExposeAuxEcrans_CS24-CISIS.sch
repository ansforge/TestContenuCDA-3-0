<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   JDV_EnfantExposeAuxEcrans_CS24-CISIS.sch :
    Contenu :
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        31/10/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_EnfantExposeAuxEcrans_CS24_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité des valeurs des enfants exposés aux écrans</p>
    <param name="path_jdv" value="$JDV_EnfantExposeAuxEcrans_CS24_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/observation/value'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.52' and cda:code/cda:qualifier/cda:value/@code='MED-1275']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
