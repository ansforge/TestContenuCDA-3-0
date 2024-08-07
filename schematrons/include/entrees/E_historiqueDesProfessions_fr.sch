<?xml version="1.0" encoding="UTF-8"?>

<!-- E_historiqueDesProfessions_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Historique-des-professions (IHE-PCC - Past or Present Occupation Observation - 1.3.6.1.4.1.19376.1.7.3.1.4.24.19) au CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 03/07/2023 : Création
        10/01/2024 : MAJ du schematron 
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_historiqueDesProfessions_fr">
    <title>CI-SIS Entrée "FR-Historique-des-professions"</title>
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.19']">
        
        <!-- Test des templateId pour l'entrée "FR-Historique-des-professions" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.124']">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Historique-des-professions" doit avoir un 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.124"
        </assert>
        <!-- Test de la conformité du <id> -->
        <assert test="count(cda:id)&gt;=1">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément id doit etre présent une ou plusiers fois [1..*].
        </assert>
        <!-- Test de la conformité du <code> -->
        <assert test="count(cda:code)=1 and cda:code/@code='11341-5'">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément "code" est obligatoire [1..1], avec les attributs :
            - @code="11341-5" (cardinalité [1..1])
            - @codeSystem="2.16.840.1.113883.6.1" (cardinalité [1..1])
        </assert>
        <!-- Test de la conformité du <statusCode> -->
        <assert test="cda:statusCode[@code = 'completed' or @code ='active']">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément "statusCode" est obligatoire [1..1] avec l'attribut @code =
            "completed" pour les professions passées.
            "active" pour les professions en cours.
            
        </assert>
        <!-- Test de la conformité du <effectiveTime> -->
        <assert test="cda:effectiveTime">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément "effectiveTime" est obligatoire [1..1].
        </assert>
        <assert test="cda:effectiveTime/cda:low">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", le sous élément "low" est obligatoire [1..1].
        </assert>
        <!-- Test de la conformité du <value> -->
        <assert test="cda:value">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément "value" est obligatoire [1..1].
        </assert>
        
        <!-- Test de la conformité du <participant> -->
        <assert test="cda:participant">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément "participant" est obligatoire [1..1].
        </assert>
        
        <assert test="cda:participant/cda:participantRole">
            [E_historiqueDesProfessions_fr.sch] Erreur de conformité CI-SIS : 
            Dans l'entrée "FR-Historique-des-professions", l'élément "participant/participantRole est obligatoire.
            @codeSystemName='IHERoleCode'
        </assert>
    </rule>
    
</pattern>
