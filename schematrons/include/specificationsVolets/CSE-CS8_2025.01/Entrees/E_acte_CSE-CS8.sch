<?xml version="1.0" encoding="UTF-8"?>


<!--  E_acte_CSE-CS8.sch
    
    Vérification des entrées FR-act de la section section FR-Actes-et-interventions (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11) du CSE-CS8
    
    Historique :
    01/06/2021 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_acte_CSE-CS8">
    <title>Vérification des entrées FR-act de la section FR-Actes-et-interventions du CSE-CS8</title>
    
    <!-- ****** Contexte ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>
        
        <!-- Vérifier que l'entrée 'Gestes techniques spécialisés' est présente -->
        <assert test='.//cda:procedure[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19"]/cda:code/@code="MED-174"'>
            [E_acte_CSE-CS8] Erreur de conformité : L'entrée FR-act de code "MED-174" est obligatoire pour indiquer la présence des Gestes techniques spécialisés.
        </assert>
        
        <!-- Vérifier que l'entrée 'dépistage de la surdité réalisé' est présente -->
        <assert test='.//cda:procedure[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19"]/cda:code/@code="MED-1304"'>
            [E_acte_CSE-CS8] Erreur de conformité : L'entrée FR-act de code "MED-1304" est obligatoire pour indiquer la présence de dépistage de la surdité réalisé.
        </assert>
        
        
        <assert test='.//cda:procedure[@negationInd="false" and cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19" and cda:code/@code="MED-1304"]/cda:entryRelationship/cda:observation/cda:code/@code="MED-1305"
            or .//cda:procedure[@negationInd="true" and cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19" and cda:code/@code="MED-1304"]/not(cda:entryRelationship/cda:observation/cda:code/@code="MED-1305")'>
            [E_acte_CSE-CS8] Erreur de conformité : L'entrée FR-act de code "MED-1304" contient obligatoirement le Résultat du test de l'audition de code "MED-1305" , si le dépistage a été réalisé.
        </assert>
    </rule>
</pattern>

