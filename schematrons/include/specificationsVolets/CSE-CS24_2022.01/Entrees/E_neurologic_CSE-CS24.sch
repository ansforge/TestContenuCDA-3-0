<?xml version="1.0" encoding="UTF-8"?>

<!-- E_neurologic_CSE-CS24
    
    Vérification des entrées FR-Probleme de la sous-section Système nerveux du CSE-CS24 
    
    Historique :
    24/06/2011 : Création
    22/11/2017 : Mise à jour des codes TA_CS ==> TA_ASIP
    15/05/2018 : MAJ par rapport à la maj du volet
    23/02/2021 : Séparation des schématrons par document (ici CSE-CS24) et modification des messages d'erreur 
    30/08/2021 : Suppression du [@negationInd] dans cda:observation[@negationInd] qui n'est pas obligatoire dans l'observation 
    06/04/2022 : Modification des codes en dur SNOMED 3.5 en CIM-10
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_neurologic_CSE-CS24">
    <title>Vérification des entrées FR-Probleme de la sous-section Système nerveux du CSE-CS24</title>
    
    <!-- ****** Contexte = sous-section Système nerveux ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.35"]'>
        
        <!-- Vérifier que l'entrée 'Spina bifida' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="Q05.9"'>
            [E_neurologic_CSE-CS24] Erreur de conformité : 
            L'entrée FR-Probleme de code "Q05.9" est obligatoire pour indiquer l'absence ou la présence de 'Spina bifida'.
        </assert>
        
        <!-- Vérifier que l'entrée 'Infirmité motrice cérébrale' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="G80.9"'>
            [E_neurologic_CSE-CS24] Erreur de conformité : 
            L'entrée FR-Probleme de code "G80.9" est obligatoire pour indiquer l'absence ou la présence d'une 'Paralysie cérébrale'.
        </assert>        
        
        <!-- Vérifier que l'entrée 'Autre' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="GEN-092.01.02"'>
            [E_neurologic_CSE-CS24] Erreur de conformité : 
            L'entrée FR-Probleme de code "GEN-092.01.02" est obligatoire pour indiquer l'absence ou la présence d'une autre affection du système nerveux.
        </assert>
    </rule>
    
</pattern>




