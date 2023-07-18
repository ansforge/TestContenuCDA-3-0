<?xml version="1.0" encoding="UTF-8"?>

<!-- E_historiqueStatutsProfessionnels_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Historique-statuts-professionnels (IHE-PCC -History of Employment Status Observation - 1.3.6.1.4.1.19376.1.7.3.1.4.24.18) au CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 03/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_historiqueStatutsProfessionnels_fr">
    <title>CI-SIS Entrée "FR-Historique-statuts-professionnels"</title>
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.18']">
        
        <!-- Test des templateId pour l'entrée "FR-Historique-statuts-professionnels" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.123']">
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Historique-statuts-professionnels" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.124"
        </assert>
        <!-- Test de la conformité du <id> -->
        <assert test="count(cda:id)&gt;=1">
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément id doit etre présent une ou plusiers fois [1..*].
        </assert>
        <!-- Test de la conformité du <code> -->
        <assert test="cda:code">
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément code est obligatoire [1..1].
        </assert>
        <!-- Test de la conformité du <statusCode> -->
        <assert test="cda:statusCode">
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément statusCode est obligatoire [1..1].
        </assert>
        <!-- Test de la conformité du <effectiveTime> -->
        <assert test="cda:effectiveTime">
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément code est obligatoire [1..1].
        </assert>
        <!-- Test de la conformité du <value> -->
        <assert test="cda:value">
            [E_historiqueStatutsProfessionnels_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-statuts-professionnels", l'élément code est obligatoire [1..1].
        </assert>
    </rule>
    
</pattern>
