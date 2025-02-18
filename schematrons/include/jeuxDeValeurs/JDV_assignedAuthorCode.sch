<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_assignedAuthorCode.sch (spécialisation du pattern dansJeuDeValeurs.sch)
    
    Contenu :
        Contrôle du code de l'auteur (nullFlavor autorisé)

    Paramètres d'appel :
        "path_jdv" : chemin relatif du fichier jeu de valeurs
        "vue_elt" : chemin de l'élément codé dans le CDA affiché dans le message d’erreur
        "xpath_elt" : contexte xpath de l'élément codé à contrôler dans le JDV
        "nullFlavor" : nullFlavor autorisé (1) ou non (0)
        
    Historique :
        18/02/2025 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_assignedAuthorCode" is-a="dansJeuDeValeurs">
    <p>Conformité de la spécialité de l'auteur</p>
    <param name="path_jdv" value="$jdv_assignedAuthorCode"/>
    <param name="vue_elt" value="'author/assignedAuthor/code'"/>
    <param name="xpath_elt" value="cda:author/cda:assignedAuthor/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>


