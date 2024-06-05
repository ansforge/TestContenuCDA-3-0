<?xml version="1.0" encoding="UTF-8"?>
<!-- 
     JDV_ResultatDepistage_CISIS.sch
    Contrôle du résultat du test de dépistage
    
    Paramètres d'appel :
      - path_jdv : chemin relatif du JDV_ResultatDepistage_CISIS.xml (jdv_ResultatDepistage-CISIS a été valorisé à ../jeuxDeValeurs/JDV_ResultatDepistage_CISIS.xml dans le schématron CI-SIS_BIO-ATTEST-DEPIST.sch) 
      - vue_elt : chemin affiché en cas d'erreur
      - xpath_elt : xpath de l'élément codé dans le CDA utilisant ce JDV
      - nullFlavor : autorisé (1) ou non (0)
      
    Historique :
        21/12/2023 : Création
        03/06/2024 : MAJ
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ResultatDepistage_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité du résultat du test de dépistage</p>
    <param name="path_jdv" value="$JDV_ResultatDepistage_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.1.6' and (cda:code/@code='80387-4' or cda:code/@code='75666-8' or cda:code/@code='78012-2' or cda:code/@code='94558-4' or cda:code/@code='80382-5' or cda:code/@code='80383-3' or cda:code/@code='72376-7' or cda:code/@code='75410-1' or cda:code/@code='75377-2' or cda:code/@code='29663-2' or cda:code/@code='100964-6' or cda:code/@code='26643-7' or cda:code/@code='69945-4' or cda:code/@code='40801-3' or cda:code/@code='18282-4' or cda:code/@code='19359-9' or cda:code/@code='19295-5' or cda:code/@code='19343-3' or cda:code/@code='19568-5' or cda:code/@code='14316-4' or cda:code/@code='19550-3' or cda:code/@code='19528-9' or cda:code/@code='40802-1' or cda:code/@code='19554-5' or cda:code/@code='12327-3')]/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>  