<?xml version="1.0" encoding="UTF-8"?>

<!-- E_generalApp_CSE-CS8.sch
    
    Vérification des entrées FR-Probleme de la sous-section Etat général du CSE-CS8
    
    Historique :
    24/06/2011 : Création
    22/05/2015 : Mise à jour du code pour l'élément Autre pathologie (CSE-070 à la place de XX-MCH207)
    11/10/2017 : Ajout du nom du schématron sur les messages d'erreur
    22/11/2017 : Mise à jour des codes TA_CS ==> TA_ASIP
    23/02/2021 : Séparation des schématrons par document (ici CSE-CS8) et modification des messages d'erreur 
    30/08/2021 : Suppression du [@negationInd] dans cda:observation[@negationInd] qui n'est pas obligatoire dans l'observation 
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_generalApp_CSE-CS8">
    <title>Vérification des entrées FR-Probleme de la sous-section Etat général du CSE-CS8</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.16"]'>       
        
        <!-- Vérifier que l'entrée 'Syndrome polymalformatif' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="Q89.7"'>
            [E_generalApp_CSE-CS8] Erreur de conformité : L'entrée FR-Probleme de code "Q89.7" est obligatoire pour indiquer l'absence ou la présence de Syndrome polymalformatif.
        </assert>
        
        <!-- Vérifier que l'entrée 'Anomalie congénitale' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="Q89.9"'>
            [E_generalApp_CSE-CS8] Erreur de conformité : L'entrée FR-Probleme de code "Q89.9" est obligatoire pour indiquer l'absence ou la présence d'Anomalie congénitale.
        </assert>
        
        <!-- Vérifier que l'entrée 'Autre anomalie' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="GEN-092.01.02"'>
            [E_generalApp_CSE-CS8] Erreur de conformité : L'entrée FR-Probleme de code "GEN-092.01.02" est obligatoire pour indiquer l'absence ou la présence d'Autre anomalie.
        </assert>
        
        <!-- Vérifier que l'entrée 'Trisomie 21' est présente -->
        <assert test='.//cda:entry/cda:observation/cda:value/@code="Q90"'>
            [E_generalApp_CSE-CS8] Erreur de conformité : L'entrée FR-Probleme de code "Q90" est obligatoire pour indiquer l'absence ou la présence de trisomie 21.
        </assert>
        
        <!-- Vérifier que l'entrée FR-Certitude est présente dans l'entrée 'Trisomie 21' -->
        <assert test='.//cda:entry/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.37" and cda:value/@code="Q90"]/cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.171"]/cda:code/@code="66455-7"'>
            [E_generalApp_CSE-CS8] Erreur de conformité : L'entrée FR-Certitude de code "66455-7" est obligatoire dans l'entrée 'Trisomie 21'.
        </assert>
        
        <!-- Vérifier que l'entrée FR-Certitude est présente dans l'entrée 'Autre anomalie' -->
        <assert test='.//cda:entry/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.37" and cda:value/@code="GEN-092.01.02"]/cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.171"]/cda:code/@code="66455-7"'>
            [E_generalApp_CSE-CS8] Erreur de conformité : L'entrée FR-Certitude de code "66455-7" est obligatoire dans l'entrée 'Autre anomalie'.
        </assert>
        
    </rule>
</pattern>