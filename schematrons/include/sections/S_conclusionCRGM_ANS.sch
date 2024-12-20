<?xml version="1.0" encoding="UTF-8"?>

<!--  S_conclusionGRGM_ANS.sch
    
     Vérification de la conformité de la section FR-Conclusion-CR-GM (1.2.250.1.213.1.1.2.67) créée par l'ANS
        
    Historique :
    12/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_conclusionGRGM_ANS">
    <title>Vérification de la conformité de la section FR-Conclusion-CR-GM (1.2.250.1.213.1.1.2.67) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.67"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_conclusionGRGM_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test='cda:code[@code = "50397-9"]'>
            [S_conclusionGRGM_ANS.sch] Erreur de conformité CI-SIS : Le code de cette section doit être '50397-9'
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_conclusionGRGM_ANS.sch] Erreur de conformité CI-SIS : Le code de la section doit être un code LOINC  
            system (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test="cda:text">
            [S_conclusionGRGM_ANS.sch] Erreur de conformité CI-SIS : La section FR-Conclusion-CR-GM doit contenir un élément text.
        </assert>
        
    </rule>
</pattern>
