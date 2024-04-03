<?xml version="1.0" encoding="UTF-8"?>


<!--  S_pointsDeVigilances-non-code_ANS.sch
    
     Vérification de la conformité de la section FR-Points-de-vigilances-non-code (1.2.250.1.213.1.1.2.245) créée par l'ANS
    
    Historique :
    03/04/2024 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_pointsDeVigilances-non-code_ANS">
    <title>Vérification de la conformité de la section FR-Points-de-vigilances-non-code (1.2.250.1.213.1.1.2.245) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.245"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_pointsDeVigilances-non-code_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_pointsDeVigilances-non-code_ANS.sch] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'id' unique.
        </assert>
        
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code = "44944-7"]'>
            [S_pointsDeVigilances-non-code_ANS.sch] Erreur de conformité CI-SIS : Le code de cette section doit être '44944-7'
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_pointsDeVigilances-non-code_ANS.sch] Erreur de conformité CI-SIS : L'élément 'codeSystem' doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1).
        </assert>
        
    </rule>
    
</pattern>
