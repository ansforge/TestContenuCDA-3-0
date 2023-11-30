<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_ObservationEnfant_OBP-SAP.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        09/03/2018 : Création
        25/10/2022 : Version 2022.01
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ObservationEnfant_OBP-SAP" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_ObservationEnfant_OBP-SAP"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:organizer[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']/cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>