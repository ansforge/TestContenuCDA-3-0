<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_DeveloppementPsychomoteur_CS24-CISIS.sch :
    Contenu :
    Contrôle des codes de développement psychomoteur de l'enfant  (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
       31/10/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_DeveloppementPsychomoteur_CS24_CISIS" is-a="dansJeuDeValeurs">
    <p>Conformité des codes de développement psychomoteur de l'enfant </p>
    <param name="path_jdv" value="$JDV_DeveloppementPsychomoteur_CS24_CISIS"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code'"/>
    <param name="xpath_elt" value="cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.161']/cda:entry/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
