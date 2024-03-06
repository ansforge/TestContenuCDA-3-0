<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_HL7_PersonalRelationshipRoleType.sch (spécialisation du pattern dansJeuDeValeurs.sch)
    
    Contenu :
    Contrôle du code du relatedSubject d'un sujet dans une entrée Fr-Sujet (nullFlavor interdit)
    
    Paramètres d'appel :
        "path_jdv" : chemin relatif du fichier jeu de valeurs (ici JDV_HL7_PersonalRelationshipRoleType_CISIS a été valorisé à ../../jeuxDeValeurs/JDV_HL7_PersonalRelationshipRoleType_CISIS.xml dans le schématron CI-SIS_StructurationMinimale.sch)
        "vue_elt" : chemin de l'élément codé dans le CDA affiché dans le message d’erreur
        "xpath_elt" : contexte xpath de l'élément codé à contrôler dans le JDV
        "nullFlavor" : nullFlavor autorisé (1) ou non (0)
        
    Historique :
        19/02/2024 : SBM : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_HL7_PersonalRelationshipRoleType" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_HL7_PersonalRelationshipRoleType_CISIS"/>
    <param name="vue_elt" value="'subject/relatedSubject/code'"/>
    <param name="xpath_elt" value="cda:subject[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.15.2']/cda:relatedSubject/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

