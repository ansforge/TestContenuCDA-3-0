<?xml version="1.0" encoding="UTF-8"?>

<!-- JDV_HandicapDeficit_IPS.sch (spécialisation du pattern dansJeuDeValeurs.sch)
    
    Contenu :
        Contrôle du code d'une entrée FR-Evaluation
        
    Paramètres d'appel :
        "path_jdv" : chemin relatif du fichier jeu de valeurs (ici JDV_HandicapDeficit_IPS a été valorisé à ../../jeuxDeValeurs/JDV_Handicap_Deficit_IPS_CISIS.xml dans le schématron CI-SIS_StructurationMinimale.sch)
        "vue_elt" : chemin de l'élément codé dans le CDA affiché dans le message d’erreur
        "xpath_elt" : contexte xpath de l'élément codé à contrôler dans le JDV
        "nullFlavor" : nullFlavor autorisé (1) ou non (0)
        
    Historique :
        11/06/2024 : ANS : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_HandicapDeficit_CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_HandicapDeficit_CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/code"/>
    <param name="xpath_elt" value="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7' and cda:code/@code='52621-0']/cda:component/cda:observation/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>

