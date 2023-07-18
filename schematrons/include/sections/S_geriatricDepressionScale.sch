<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_geriatricDepressionScale.sch ]O@%#o>>=-

Teste la conformité de la section "Geriatric Depression Scale" (1.3.6.1.4.1.19376.1.5.3.1.1.12.2.4)aux spécifications d'IHE PCC 

Historique :
11/07/2023 : HTR : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_geriatricDepressionScale">
    
    <title>IHE PCC Geriatric Depression Scale Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.2.4"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [S_geriatricDepressionScale.sch] Erreur de conformité PCC : le templateId de 'Geriatric Depression Scale' 
            ne peut être utilisé que pour une section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_geriatricDepressionScale] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'id'.
        </assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "48542-5"]'> 
            [S_geriatricDepressionScale] : Le code de la section 'Geriatric Depression Scale' doit être 48542-5
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_geriatricDepressionScale] : L'attribut 'codeSystem' de la section 'Geriatric Depression Scale' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test="count(cda:text)=1">
            [S_geriatricDepressionScale] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
        <!-- Vérifier que l'entrée "Geriatric Depression Score Observation" est présente -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.3.4"]'>
            [S_geriatricDepressionScale] : La section 'Geriatric Depression Scale'
            doit contenir au moins une entrée Family History Observation.
        </assert>
        
    </rule>
</pattern>
