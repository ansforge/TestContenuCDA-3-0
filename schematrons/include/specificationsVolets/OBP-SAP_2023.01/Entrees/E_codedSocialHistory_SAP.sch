<?xml version="1.0" encoding="UTF-8"?>

<!-- E_codedSocialHistory_SAP.sch 
    
    Historique :
    29/08/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_codedSocialHistory_SAP">
    <title>Vérification de l'entrées Habitus, Mode de vie "Consommation de drogue" (1.3.6.1.4.1.19376.1.5.3.1.4.13.4) du OBP-SAP</title>
    
    <!-- ****** Contexte : Entree Habitus, Mode de vie ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]'>
        
        <!-- Vérification si l'entrée Habitus, Mode de vie 'Consommation de drogue' est présente, la termini utilisée dans <value> est "ChemIDPlus" --> 
        <assert test='not(cda:code[@code="11343-1"]) or cda:value[@codeSystem="2.16.840.1.113883.6.96"]'>
            [E_codedSocialHistory_SAP] Erreur de conformité : 
            La terminologie utilisée dans l'élément "value" de l'entrée "Consommation de drogue" de code 11343-1 est "ChemIDPlus".
        </assert>
            
    </rule>
</pattern>
