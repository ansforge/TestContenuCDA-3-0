<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_TypeAllaitementNouveauNe_CISIS.sch :
    Contenu :
    Contrôle du code de la profession d'une personne de la section Habitus, Mode de vie (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        18/10/23 : ASIP/CRI : création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_TypeAllaitementNouveauNe_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité de la profession de la personne au CI-SIS</p>
    <param name="path_jdv" value="$JDV_TypeAllaitementNouveauNe_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/observation/value'"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.4' and cda:code/cda:qualifier/cda:value/@code='67704-7']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
