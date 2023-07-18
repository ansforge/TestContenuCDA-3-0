<?xml version="1.0" encoding="UTF-8"?>

<!--  S_problemesActifsNonCode_ANS.sch
    
     Vérification de la conformité de la section FR-Problemes-actifs-non-code (1.2.250.1.213.1.1.2.176) créée par l'ANS
        
    Historique :
    12/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_problemesActifsNonCode_ANS">
    <title>Vérification de la conformité de la section FR-Problemes-actifs-non-code (1.2.250.1.213.1.1.2.176) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.176"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_problemesActifsNonCode_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test='cda:code[@code = "11450-4"]'>
            [S_problemesActifsNonCode_ANS.sch] Erreur de conformité CI-SIS : Le code de la section FR-Problemes-actifs-non-code doit être '11450-4'
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_problemesActifsNonCode_ANS.sch] Erreur de conformité CI-SIS : Le code de la section FR-Problemes-actifs-non-code doit être un code LOINC  
            system (2.16.840.1.113883.6.1). 
        </assert> 
        
    </rule>
</pattern>
