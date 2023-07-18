<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_painScaleAssessment.sch ]O@%#o>>=-

Teste la conformité de la section "Pain Scale Assessment" (1.3.6.1.4.1.19376.1.5.3.1.1.12.2.2)aux spécifications d'IHE PCC 

Historique :
11/07/2023 : HTR : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_painScaleAssessment">
    
    <title>IHE PCC Pain Scale Assessment Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.2.2"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [S_painScaleAssessment.sch] Erreur de conformité PCC : le templateId de 'Pain Scale Assessment' 
            ne peut être utilisé que pour une section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_painScaleAssessment] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'id'.
        </assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "38208-5"]'> 
            [S_painScaleAssessment] : Le code de la section 'Pain Scale Assessment' doit être '38208-5'.
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_painScaleAssessment] : L'attribut 'codeSystem' de la section 'Pain Scale Assessment' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test="count(cda:text)=1">
            [S_painScaleAssessment] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
        <!-- Vérifier que l'entrée "IHE Pain Score Observation" est présente -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1"]'>
            [S_painScaleAssessment] : La section 'Pain Scale Assessment'
            doit contenir au moins une entrée IHE Pain Score Observation.
        </assert>
        
    </rule>
</pattern>
