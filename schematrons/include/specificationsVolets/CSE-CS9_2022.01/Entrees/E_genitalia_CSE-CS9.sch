<?xml version="1.0" encoding="UTF-8"?>

<!--  E_genitalia_CSE-CS9
    
    Vérification des entrées FR-Probleme de la sous-section Système réno-uro-génital du CSE-CS9
    
    Historique :
    24/06/2011 : Création
    11/10/2017 : Ajout du nom du schématron sur les messages d'erreur
    23/02/2021 : Séparation des schématrons par document (ici CSE-CS9) et modification des messages d'erreur 
    30/08/2021 : Suppression du [@negationInd] dans cda:observation[@negationInd] qui n'est pas obligatoire dans l'observation 
    06/04/2022 : Modification des codes en dur SNOMED 3.5 en CIM-10
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_genitalia_CSE-CS9">
    <title>Vérification des entrées FR-Probleme de la sous-section Système réno-uro-génital du CSE-CS9</title>
    
        <!-- ****** Contexte = Sous-section Système réno-uro-génital ****** -->
        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.36"]'>            
            
            <!-- Vérifier que l'entrée 'Malformation urinaire' est présente -->
            <assert test='.//cda:entry/cda:observation/cda:value/@code="Q64.9"'>
                [E_genitalia_CSE-CS9] Erreur de conformité : 
                L'entrée FR-Probleme de code "Q64.9" est obligatoire pour indiquer l'absence ou la présence d'une 'Malformation urinaire'.
            </assert>
            
            <!-- Vérifier que l'entrée 'Malformation génitale' est présente -->
            <assert test='.//cda:entry/cda:observation/cda:value/@code="Q52.9" or .//cda:entry/cda:observation/cda:value/@code="Q55.9"'>
                [E_genitalia_CSE-CS9] Erreur de conformité : 
                L'entrée FR-Probleme de code "Q52.9" (Malformation congénitale des organes génitaux de la femme) ou "Q55.9" (Malformation congénitale des organes génitaux de l'homme) est obligatoire pour indiquer l'absence ou la présence d'une 'Malformation génitale'.
            </assert>
            
            <!-- Vérifier que l'entrée 'Autre' est présente -->
            <assert test='.//cda:entry/cda:observation/cda:value/@code="GEN-092.01.02"'>
                [E_genitalia_CSE-CS9] Erreur de conformité : 
                L'entrée FR-Probleme de code "GEN-092.01.02" est obligatoire pour indiquer l'absence ou la présence d'une autre affection du système réno-uro-génita.
            </assert>
            
        </rule>
</pattern>


