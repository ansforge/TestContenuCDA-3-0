<?xml version="1.0" encoding="UTF-8"?>

<!--  E_musculo_CSE-CS9.sch
    
    Vérification des entrées FR-Probleme de la sous-section Système musculosquelettique du CSE-CS8
    
    Historique :
    24/06/2011 : Création
    12/10/2017 : Ajout du nom du schématron dans les messages d'erreur
    23/02/2021 : Séparation des schématrons par document (ici CSE-CS9) et modification des messages d'erreur 
    30/08/2021 : Suppression du [@negationInd] dans cda:observation[@negationInd] qui n'est pas obligatoire dans l'observation 
    06/04/2022 : Modification des codes en dur SNOMED 3.5 en CIM-10
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_musculo_CSE-CS9">
    <title>Vérification des entrées FR-Probleme de la sous-section Système musculosquelettique du CSE-CS9</title>
    
    <!-- ****** Contexte = sous-section Système musculosquelettique ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.34"]'>
        
        <!-- Vérifier que l'entrée 'Luxation de la hanche' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="Q65.2"'>
            [E_musculo_CSE-CS9] Erreur de conformité : 
            L'entrée FR-Probleme de code "Q65.2" est obligatoire pour indiquer l'absence ou la présence d'une 'Luxation congénitale de la hanche'.
        </assert>
        
        <!-- Vérifier que l'entrée 'Autre' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="GEN-092.01.02"'>
            [E_musculo_CSE-CS9] Erreur de conformité : 
            L'entrée FR-Probleme de code "GEN-092.01.02" est obligatoire pour indiquer l'absence ou la présence d'une autre affection du système musculosquelettique.
        </assert>
    </rule>
</pattern>

