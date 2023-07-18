<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_extremities.sch ]O@%#o>>=-

Teste la conformité de la section "Extremities Section" (1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1) aux spécifications d'IHE PCC

Historique :
11/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_extremities">
    
    <title>IHE PCC - Extremities Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [S_extremities.sch] Erreur de conformité PCC : le templateId de 'Extremities' 
            ne peut être utilisé que pour une section.
        </assert>
        
        <assert test="count(cda:id)=1">
            [S_extremities.sch]] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'id'.
        </assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10196-4"]'> 
            [S_extremities.sch] : Le code de la section 'Extremities' doit être '10196-4'.
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_extremities.sch] : L'attribut 'codeSystem' de la section 'Extremities' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test="count(cda:text)=1">
            [S_extremities] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
    </rule>
</pattern>
