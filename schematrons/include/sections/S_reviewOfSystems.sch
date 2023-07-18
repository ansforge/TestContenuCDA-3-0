<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_reviewOfSystems.sch ]O@%#o>>=-

Teste la conformité de la section "Review of Systems Section" (1.3.6.1.4.1.19376.1.5.3.1.3.18) aux spécifications d'IHE PCC

Historique :
11/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_reviewOfSystems">
    
    <title>IHE PCC Review of Systems Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.18"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [S_reviewOfSystems.sch] Erreur de conformité PCC : le templateId de 'Review of Systems' ne peut être utilisé que pour une section.
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10187-3"]'> 
            [S_reviewOfSystems.sch] : Le code de la section 'Review of Systems' doit être '10187-3'.
        </assert>
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_reviewOfSystems.sch] : L'attribut 'codeSystem' de la section 'Review of Systems' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test="count(cda:title)=1">
            [S_reviewOfSystems.sch]] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'title'.
        </assert>
        <assert test="count(cda:text)=1">
            [S_reviewOfSystems] Erreur de conformité CI-SIS : Cette section doit contenir un élément 'text'.
        </assert>
        
    </rule>
</pattern>
