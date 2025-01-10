<?xml version="1.0" encoding="UTF-8"?>


<!--  E_developpementPsychomoteur_CSE-CS9.sch
    
    Vérification des entrées FR-Simple-Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13) de la sous-section FR-Developpement-psychomoteur (1.3.6.1.4.1.19376.1.7.3.1.1.13.4) du CSE-CS9
    
    Historique :
    01/06/2021 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_developpementPsychomoteur_CSE-CS9">
    <title>Vérification des entrées FR-Simple-Observation de la sous-section FR-Developpement-psychomoteur du CSE-CS9</title>
    
    <!-- ****** Contexte = sous-section FR-Developpement-psychomoteur ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.4"]'>
        
        <!-- Vérifier que le code de l'entrée 'Repérage troubles du neurodéveloppement' est présent -->
        <assert test='.//cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code/@code="MED-1274"'>
            [E_developpementPsychomoteur_CSE-CS9] Erreur de conformité : L'entrée FR-Simple-Observation de code "MED-1274" est obligatoire pour indiquer la présence de 'Repérage troubles du neurodéveloppement'.
        </assert>
        
    </rule>
</pattern>

