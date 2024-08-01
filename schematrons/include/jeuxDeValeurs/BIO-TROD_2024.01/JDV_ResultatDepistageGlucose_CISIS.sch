<?xml version="1.0" encoding="UTF-8"?>
<!-- 
     JDV_ResultatDepistageGlucose_CISIS.sch
    Contrôle du résultat du test de dépistage
    
    Paramètres d'appel :
      - path_jdv : chemin relatif du JDV_ResultatDepistageGlucose_CISIS.xml (jdv_ResultatDepistageGlucose_CISIS a été valorisé à ../jeuxDeValeurs/JDV_ResultatDepistageGlucose_CISIS.xml dans le schématron CI-SIS_BIO-ATTEST-DEPIST.sch) 
      - vue_elt : chemin affiché en cas d'erreur
      - xpath_elt : xpath de l'élément codé dans le CDA utilisant ce JDV
      - nullFlavor : autorisé (1) ou non (0)
      
    Historique :
        14/03/2024 : Création
        04/06/2024 : MAJ
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ResultatDepistageGlucose_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité du résultat du test de dépistage</p>
    <param name="path_jdv" value="$JDV_ResultatDepistageGlucose_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/interpretationCode'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.1.6' and cda:code/@code='5792-7']/cda:interpretationCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>  