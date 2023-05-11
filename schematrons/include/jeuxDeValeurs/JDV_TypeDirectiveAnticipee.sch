<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_TypeDirectiveAnticipee.sch (spécialisation du pattern dansJeuDeValeurs.sch)
    
    Contenu :
    Contrôle du code d'une entrée FR-DirectiveAnticipee (nullFlavor interdit)
    
    Paramètres d'appel :
        "path_jdv" : chemin relatif du fichier jeu de valeurs (ici jdv_TypeDirectiveAnticipee a été valorisé à ../../jeuxDeValeurs/JDV_TypeDirectiveAnticipee-CISIS.xml dans le schématron CI-SIS_StructurationMinimale.sch)
        "vue_elt" : chemin de l'élément codé dans le CDA affiché dans le message d’erreur
        "xpath_elt" : contexte xpath de l'élément codé à contrôler dans le JDV
        "nullFlavor" : nullFlavor autorisé (1) ou non (0)
        
    Historique :
        30/11/2022 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_TypeDirectiveAnticipee" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_typeDirectiveAnticipee"/>
    <param name="vue_elt" value="'observation/code'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.7']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

