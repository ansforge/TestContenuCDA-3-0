<?xml version="1.0" encoding="UTF-8"?>

<!-- JDV_Gravite.sch (spécialisation du pattern dansJeuDeValeurs.sch)
    
    Contenu :
        Contrôle du code d'une entrée FR-Gravite-effet-indesirable
        
    Paramètres d'appel :
        "path_jdv" : chemin relatif du fichier jeu de valeurs (ici JDV_Gravite a été valorisé à ../../jeuxDeValeurs/JDV_Gravite_CISIS.xml dans le schématron CI-SIS_StructurationMinimale.sch)
        "vue_elt" : chemin de l'élément codé dans le CDA affiché dans le message d’erreur
        "xpath_elt" : contexte xpath de l'élément codé à contrôler dans le JDV
        "nullFlavor" : nullFlavor autorisé (1) ou non (0)
        
    Historique :
        11/06/2024 : ANS : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Gravite" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_gravite"/>
    <param name="vue_elt" value="observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.212']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>
