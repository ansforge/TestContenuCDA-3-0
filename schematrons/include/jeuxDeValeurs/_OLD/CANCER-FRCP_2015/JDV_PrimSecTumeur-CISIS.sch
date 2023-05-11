<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_PrimSecTumeur-CISIS.sch :
    Contenu :

    Paramètres d'appel :
        Néant 
    Historique :
        10/01/2014 : CRI : Création
        14/10/19 : NMA : Mise à jour du nom du schématron, de l'id, de la variable et du titre
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_PrimSecTumeur-CISIS" is-a="dansJeuDeValeurs">
    <p>PrimSecTumeur</p>
    <param name="path_jdv" value="$JDV_PrimSecTumeur-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.3.14.1']/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code='G-1009']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern>   


